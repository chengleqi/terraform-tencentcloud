## TencentCloud CVM
- ap-hongkong
- CentOS 7.9
- SPOTPAID
- 2c4g
- 50G

## Provider Config

[reference](https://zhuanlan.zhihu.com/p/505721089)

### CLI Configuration File

[CLI Configuration File](https://www.terraform.io/cli/config/config-file)

```bash
# env value TF_CLI_CONFIG_FILE
export TF_CLI_CONFIG_FILE=$HOME/.terraformrc

# .terraformrc
plugin_cache_dir   = "$HOME/.terraform.d/plugin-cache"
disable_checkpoint = true
provider_installation {
  filesystem_mirror {
    path    = "/home/chengleqi/.terraform.d/plugin-cache"
    include = ["registry.terraform.io/*/*"]
  }
}
```
### provider-plugin directory structure
```bash
# /home/chengleqi/.terraform.d/plugin-cache
plugin-cache
└── registry.terraform.io
    └── tencentcloudstack
        └── tencentcloud
            └── 1.71.0
                └── linux_amd64
                    ├── CHANGELOG.md
                    ├── LICENSE
                    ├── README.md
                    └── terraform-provider-tencentcloud_v1.71.0

5 directories, 4 files
```