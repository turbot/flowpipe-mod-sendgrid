---
repository: "https://github.com/turbot/flowpipe-mod-sendgrid"
---

# Flowpipe SendGrid Mod

Run pipelines and use triggers for SendGrid resources.

## References

[SendGrid](https://sendgrid.com/) is a cloud-based email delivery and marketing platform that provides email sending, delivery, and management services for businesses and developers.

[Flowpipe](https://flowpipe.io) is an open source workflow tool.

[Flowpipe Mods](https://flowpipe.io/docs/reference/mod-resources#mod) are collections of `pipelines` and `triggers`.

## Documentation

- **[Pipelines →](https://hub.flowpipe.io/mods/turbot/sendgrid/pipelines)**
- **[Triggers →](https://hub.flowpipe.io/mods/turbot/sendgrid/triggers)**

## Getting started

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

### Usage

Start your server to get started:

```sh
flowpipe service start
```

Run a pipeline:

```sh
flowpipe pipeline run send_email
```

### Credentials

This mod uses the credentials configured in `flowpipe.pvars` or passed through `--pipeline-args api_key`.

### Configuration

Pipelines have [input variables](https://flowpipe.io/docs/using-flowpipe/mod-variables) that can be configured to better match your environment and requirements. Some variables have defaults defined in its source file, e.g., `variables.hcl`, but these can be overwritten in several ways:

- Copy and rename the `flowpipe.pvars.example` file to `flowpipe.pvars`, and then modify the variable values inside that file
- Pass in a value on the command line:

  ```shell
  flowpipe pipeline run send_email --pipeline-arg api_key="SG.ABCDEFGHIJ-a1b2c3d4e5f6g7h8i9j10k11l12m13n14o15p16q17r18s19t20u21v"
  ```

These are only some of the ways you can set variables. For a full list, please see [Passing Input Variables](https://flowpipe.io/docs/using-flowpipe/mod-variables#passing-input-variables).

## Contributing

If you have an idea for additional controls or just want to help maintain and extend this mod ([or others](https://github.com/topics/flowpipe-mod)) we would love you to join the community and start contributing.

- **[Join our Slack community →](https://flowpipe.io/community/join)** and hang out with other Mod developers.

Please see the [contribution guidelines](https://github.com/turbot/flowpipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/flowpipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://github.com/turbot/flowpipe-mod-sendgrid/blob/main/LICENSE).

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Flowpipe](https://github.com/turbot/flowpipe/labels/help%20wanted)
- [SendGrid Mod](https://github.com/turbot/flowpipe-mod-sendgrid/labels/help%20wanted)
