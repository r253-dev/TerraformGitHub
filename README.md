## Installation

### Authentication

The GitHub provider taps into GitHub CLI authentication. You can authenticate with GitHub.

```bash
gh auth login
```

show authentication status.

```bash
gh auth status
```

set the environment variable `GITHUB_TOKEN

```bash
gh auth status -t
export GITHUB_TOKEN=your_token
```

GitHuv provider offers multiple ways to authenticate with GitHub. You can find more information [here](https://registry.terraform.io/providers/integrations/github/latest/docs#authentication)

## Usage

```bash
terraform plan
terraform apply
```

## import existing repository

add resource to the `main.tf` file.

ex.

```
resource "github_repository" "react_template_repository" {
  name = "ReactTemplate"
}
```

import the resource.

```bash
terraform import github_repository.react_template_repository ReactTemplate
```

check diff

```bash
terraform plan
```
