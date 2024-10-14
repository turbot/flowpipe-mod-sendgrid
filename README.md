# SendGrid Mod for Flowpipe

SendGrid pipeline library for [Flowpipe](https://flowpipe.io), enabling seamless integration of SendGrid services into your workflows.

## Documentation

- **[Pipelines →](https://hub.flowpipe.io/mods/turbot/sendgrid/pipelines)**

## Getting started

### Requirements

Docker daemon must be installed and running. Please see [Install Docker Engine](https://docs.docker.com/engine/install/) for more information.

### Installation

Download and install Flowpipe (https://flowpipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install flowpipe
```

Clone:

```sh
git clone https://github.com/turbot/flowpipe-mod-sendgrid.git
cd flowpipe-mod-sendgrid
```

### Connections

By default, the following environment variables will be used for authentication:

- `SENDGRID_API_KEY`

You can also create `connection` resources in configuration files:

```sh
vi ~/.flowpipe/config/sendgrid.fpc
```

```hcl
connection "sendgrid" "sendgrid_cred" {
  api_key = "SG.R7...."
}
```

For more information on connections in Flowpipe, please see [Managing Connections](https://flowpipe.io/docs/run/connections).

### Usage

List pipelines:

```sh
flowpipe pipeline list
```

Run a pipeline:

```sh
flowpipe pipeline run send_mail
```

You can pass in pipeline arguments as well:

```sh
flowpipe pipeline run get_contact_by_id --arg contact_id=ZGkrHSypTsudrGkmdpJJ
```

To use a specific `connection`, specify the `conn` pipeline argument:

```sh
flowpipe pipeline run get_contact_by_id --arg contact_id=ZGkrHSypTsudrGkmdpJJ --arg conn=sendgrid_cred
```

For more examples on how you can run pipelines, please see [Run Pipelines](https://flowpipe.io/docs/run/pipelines).

### Configuration

No additional configuration is required.

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Flowpipe](https://flowpipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #flowpipe on Slack →](https://flowpipe.io/community/join)**

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Flowpipe](https://github.com/turbot/flowpipe/labels/help%20wanted)
- [SendGrid Mod](https://github.com/turbot/flowpipe-mod-sendgrid/labels/help%20wanted)
