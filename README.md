# amp-api-example

> **This is an example repository.** It demonstrates how teams can publish APIs to the API Marketplace (APIM) using Terraform and GitHub Actions. It is not a complete, deployable solution out of the box — see the setup requirements below.

Ideally your application/API source code lives in the same repository alongside the `infra/` and `specs/` directories.

## How it works

- Each `.tfvars` file in `infra/` maps to a deployment environment (e.g. `sbox.tfvars` → `sbox`).
- The GitHub Actions workflow auto-discovers these files and runs Terraform plan/apply for each.
- Terraform state is stored in Azure Blob Storage using Entra ID authentication (no access keys).
- The reusable workflow (`hmcts/cnp-githubactions-library`) handles OIDC-based Azure authentication.

## Repository setup required

The following **GitHub Actions repository variables** must be configured before the workflow will succeed. These are not included in this repo.

| Variable | Description |
|---|---|
| `AZURE_CLIENT_ID_<ENV>` | Client ID of the managed identity / app registration used for OIDC auth in that environment (e.g. `AZURE_CLIENT_ID_SBOX`) |
| `AZURE_SUBSCRIPTION_ID_<ENV>` | Azure subscription ID for that environment (e.g. `AZURE_SUBSCRIPTION_ID_SBOX`) |
| `AZURE_SUBSCRIPTION_<ENV>` | Subscription name or ID passed as the `subscription` input to the reusable workflow |

> Variable names are derived from the `.tfvars` filename uppercased (e.g. `sbox` → `SBOX`, `prod` → `PROD`).

The OIDC-trusted managed identity / app registration must have a federated credential configured for this repository and the relevant branch/environment.

## Adding an environment

1. Create `infra/<env>.tfvars` following the pattern in `sbox.tfvars`.
2. Add the corresponding GitHub Actions repository variables listed above.
3. Push to `main` or open a PR — the workflow will pick up the new environment automatically.

## Adding an API

1. Add your OpenAPI spec to `specs/`.
2. Add an entry to the `apis` map in your `.tfvars` file pointing to the spec path.
