# Install AWS CLI Action

[![tests](https://github.com/ankurk91/install-aws-cli-action/actions/workflows/tests.yaml/badge.svg)](https://github.com/ankurk91/install-aws-cli-action/actions)

Install AWS CLI v2 on self-hosted Linux runners.

### Features

* Cache downloaded zip file to save bandwidth on concurrent runs :rocket:
* Works for both `x86_64` and `arm64` architectures :wink:
* Tested on GitHub and [Gitea](https://docs.gitea.com/usage/actions/act-runner) Actions
* Skip installation if CLI is already installed

### Usage

```yaml
jobs:
  Deployment:
    runs-on: ubuntu-latest

    steps:
      - name: Install AWS CLI v2
        uses: ankurk91/install-aws-cli-action@v1

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ vars.AWS_REGION }}
```

### Inputs

| Name    | Required | Default | Description                                       |
|---------|----------|---------|---------------------------------------------------|
| `cache` | No       | `true`  | Determines if downloaded zip files must be cached |

### Attribution

This repo was inspired by [quipper/setup-aws-cli-action](https://github.com/quipper/setup-aws-cli-action)

### Ref links

* https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
