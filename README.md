# 介绍

本项目主要是使用 GitHub Actions 更新阿里云ESA证书，具体可以参考着篇[文章](https://aaz.ee/m9ng8k)。

### 所用的以下变量

####  Lego运行所需要的变量

| 变量名称            | 默认值  | 是否必须 | 备注                                                         |
| ------------------- | ------- | -------- | ------------------------------------------------------------ |
| ALICLOUD_ACCESS_KEY |         | 是       | 阿里云的访问密钥，用于 API 调用，需要阿里云的`AliyunDNSFullAccess`权限 |
| ALICLOUD_SECRET_KEY |         | 是       | 阿里云的安全密钥，与访问密钥配对使用，需要阿里云的`AliyunDNSFullAccess`权限 |
| EMAIL               |         | 是       | 用于 Let's Encrypt 证书续签的电子邮件地址                    |
| DOMAIN              |         | 是       | 需要续签的 SSL 证书的域名                                    |
| CERT_PATH           | `certs` | 否       | 存储证书的路径，默认值为 `certs`                             |
| RENEW_OPTION        | `renew` | 否       | Lego是续签证书或申请证书，值有`renew`或`run`                 |

*注意：`CERT_PATH`是证书保存位置，只能是字符或字符+数字，尽可能不要加**特殊字符**。` RENEW_OPTION`变量是指明lego运行方式，默认为 `renew`续签，当为 `run`时，需要特殊处理，这个会之后说明。*

#### 阿里云CLI运行所需变量

| 变量名称                   | 默认值           | 是否必须 | 备注                                                         |
| -------------------------- | ---------------- | -------- | ------------------------------------------------------------ |
| ALICLOUD_ACCESS_KEY_ID     |                  | 是       | 阿里云的访问密钥，用于 API 调用 ，需要阿里云的`AliyunYundunCertFullAccess` 和`AliyunESAFullAccess` 权限 |
| ALICLOUD_ACCESS_KEY_SECRET |                  | 是       | 阿里云的安全密钥，与访问密钥配对使用，需要阿里云的`AliyunYundunCertFullAccess` 和`AliyunESAFullAccess` 权限 |
| ALIYUN_REGION              | `ap-southeast-1` | 否       | 阿里云证书管理所在区域                                       |
| NAME                       | `lego-ssl`       | 否       | 上传到阿里云证书管理和ESA绑定证书的名称，实际上是`NAME`变量 +运行时的日期 |
| SITE_ID                    |                  | 是       | 要更新证书的ESA站点，ESA站点绑定的证书必须与域名相匹配。     |


