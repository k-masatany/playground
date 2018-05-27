## 設定可能なパラメータ

`main.tf`の`module "website"`のところに設定します。

| パラメータ                        | 意味                                      | 型     | 備考                                           |
| :-------------------------------- | :---------------------------------------- | :----- | :--------------------------------------------- |
| domain_name                       | ドメイン                                  | string |                                                |
| tags                              | リソースに共通してつけるタグ              | map    |                                                |
| certificate_domain                | (ACM)証明書を発行するドメイン             | string |                                                |
| alternative_name                  | (ACM)証明書を発行するドメインの別名       | list   |                                                |
| validation_method                 | (ACM)証明書の検証方式                     | string |                                                |
| aliases                           | (CloudFront) 代替ドメイン名               | list   |                                                |
| cache_ttl                         | (CloudFront) キャッシュ TTL               | string |                                                |
| price_class                       | (CloudFront) エッジロケーション           | string | PriceClass_All, PriceClass_200, PriceClass_100 |
| force_destroy                     | (S3) バケット削除時に中身ごと削除する     | string |                                                |
| index_document                    | (Hosting S3) default document             | string |                                                |
| error_document                    | (Hosting S3) error document               | string |                                                |
| logs_number_of_days_to_ia         | (Logging S3) IA に移行するまでの日数      | string |                                                |
| logs_number_of_days_to_glacier    | (Logging S3) Glacier に移行するまでの日数 | string |                                                |
| logs_number_of_days_to_expiration | (Logging S3) 失効するまでの日数           | string |                                                |
