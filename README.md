# summon-cerberus

Cerberus provider for [Summon](https://conjurinc.github.io/summon).

Provides access to secrets stored in [Cerberus](http://engineering.nike.com/cerberus/).

## Usage

[Set cerberus-s3 as your Summon provider](https://github.com/conjurinc/summon#flags).

Make sure to set `CERBERUS_API` via environment variable.  
Give summon a path to an object in Cerberus and it will fetch it for you and
print the value to stdout.

### Example 1
```bash
$ export CERBERUS_API='https://mycerbersus_endpoint.com'
$ cat > /tmp/my_secrets.yml <<-EOF
	DB_USER: product_name
	DB_PASSWORD: !var product/$ENVTAG/dbpassword
	DATADOG_API_TOKEN: !var datadog/$ENVTAG/datadog_api_token
EOF
$ summon --provider summon-cerberus \
         -f /tmp/my_secrets.yml \
         -D ENVTAG=myenv \
         cat @SUMMONENVFILE

DB_USER=product_name
DB_PASSWORD=Wylb6owWawtenJab
DATADOG_API_TOKEN=6d4f1e2992a11a332550aa555e630f0dc
```

### Example 2
```bash
$ export CERBERUS_API='https://mycerbersus_endpoint.com'
$ summon --provider summon-cerberus \
         -D ENVTAG=myenv
         --yaml 'DATADOG_API_TOKEN: !var product/$ENVTAG/datadog_api_token' \
         printenv | grep DATADOG_API_TOKEN

DATADOG_API_TOKEN=6d4f1e2992a11a332550aa555e630f0dc
```

### Example 3
```bash
$ export CERBERUS_API='https://mycerbersus_endpoint.com'
$ DATADOG_API_KEY=$(summon-cerberus product/myenv/datadog_api_token)
$ echo $DATADOG_API_KEY
6d4f1e2992a11a332550aa555e630f0dc
```

## Configuration

summon-cerberus uses the [official AWS Go SDK](https://github.com/aws/aws-sdk-go).
It will use the credentials file or environment variables [as they explain](https://github.com/aws/aws-sdk-go#configuring-credentials).

Additionally, see [Summon Usage](https://github.com/conjurinc/summon#usage) documentation.

## Authors
99.99% credit goes to [@burdzz](https://github.com/burdzz)  
00.01% [@anapsix](https://github.com/anapsix), for hack-jamming [@burdzz'](https://github.com/burdzz) code into Summon provider
