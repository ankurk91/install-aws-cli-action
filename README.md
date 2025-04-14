# Install AWS CLI Action

[![tests](https://github.com/ankurk91/install-aws-cli-action/actions/workflows/tests.yaml/badge.svg)](https://github.com/ankurk91/install-aws-cli-action/actions)

Install AWS CLI v2 on self-hosted Linux runners, supporting both `x86_64` and `arm64` architectures.

### Usage

```yaml
jobs:
  Deployment:
    runs-on: ubuntu-latest

    steps:
      - name: Install AWS CLI v2
        uses: ankurk91/install-aws-cli-action@1.0.0

      - name: Check AWS CLI
        run: aws --version
```

### Attribution

This repo was inspired by [quipper/setup-aws-cli-action](https://github.com/quipper/setup-aws-cli-action)

### Ref links

* https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
