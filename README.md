# SendGrid Mod for Flowpipe

SendGrid pipeline library for [Flowpipe](https://flowpipe.io), enabling seamless integration of SendGrid services into your workflows.

## Documentation

- **[Pipelines →](https://hub.flowpipe.io/mods/turbot/sendgrid/pipelines)**

## Getting started

### Installation

Download and install Flowpipe (https://flowpipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install flowpipe
```

### Credentials

By default, the following environment variables will be used for authentication:

- `SENDGRID_API_KEY`

You can also create `credential` resources in configuration files:

```sh
vi ~/.flowpipe/config/sendgrid.fpc
```

```hcl
credential "sendgrid" "sendgrid_cred" {
  api_key = "SG.R7...."
}
```

For more information on credentials in Flowpipe, please see [Managing Credentials](https://flowpipe.io/docs/run/credentials).

### Usage

[Initialize a mod](https://flowpipe.io/docs/build/index#initializing-a-mod):

```sh
mkdir my_mod
cd my_mod
flowpipe mod init
```

[Install the Sendgrid mod](https://flowpipe.io/docs/build/mod-dependencies#mod-dependencies) as a dependency:

```sh
flowpipe mod install github.com/turbot/flowpipe-mod-sendgrid
```

[Use the dependency](https://flowpipe.io/docs/build/write-pipelines/index) in a pipeline step:

```sh
vi my_pipeline.fp
```

```hcl
pipeline "my_pipeline" {

  step "pipeline" "get_contact_by_id" {
    args = {
      contact_id = "ZGkrHSypTsudrGkmdpJJ"
    }
  }
}
```

[Run the pipeline](https://flowpipe.io/docs/run/pipelines):

```sh
flowpipe pipeline run my_pipeline
```

### Developing

Clone:

```sh
git clone https://github.com/turbot/flowpipe-mod-sendgrid.git
cd flowpipe-mod-sendgrid
```

List pipelines:

```sh
flowpipe pipeline list
```

Run a pipeline:

```sh
flowpipe pipeline run get_contact_by_id --arg contact_id=ZGkrHSypTsudrGkmdpJJ
```

To use a specific `credential`, specify the `cred` pipeline argument:

```sh
flowpipe pipeline run get_contact_by_id --arg contact_id=ZGkrHSypTsudrGkmdpJJ --arg cred=sendgrid_profile
```

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Flowpipe](https://flowpipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #flowpipe on Slack →](https://flowpipe.io/community/join)**

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Flowpipe](https://github.com/turbot/flowpipe/labels/help%20wanted)
- [SendGrid Mod](https://github.com/turbot/flowpipe-mod-sendgrid/labels/help%20wanted)
