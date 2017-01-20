# summon-cerberus

Cerberus provider for [Summon](https://conjurinc.github.io/summon).

Provides access to secrets stored in [Cerberus](http://engineering.nike.com/cerberus/).

## Usage

[Set cerberus-s3 as your Summon provider](https://github.com/conjurinc/summon#flags).

Give summon a path to an object in Cerberus and it will fetch it for you and
print the value to stdout.

```bash
summon --provider summon-cerberus \
--yaml 'DATADOG_API_TOKEN: !var datadog_api_token' \
printenv DATADOG_API_TOKEN
seifadimVugOydOacjuerfijadnoQuaf
```


## Configuration

summon-cerberus uses the [official AWS Go SDK](https://github.com/aws/aws-sdk-go).
It will use the credentials file or environment variables [as they explain](https://github.com/aws/aws-sdk-go#configuring-credentials).

## Authors
99.99% credit goes to [@burdzz](https://github.com/burdzz)  
00.01% [@anapsix](https://github.com/anapsix), for hack-jamming [@burdzz](https://github.com/burdzz'] code into Conjur provider
