#!/bin/bash

# based on script from: https://willhaley.com/blog/generate-jwt-with-bash/

if [ -z "$SECRET" ]
then
  echo "\$SECRET is empty"
  exit 1
fi
if [ -z "$USER_ID" ]
then
  echo "\$USER_ID is empty"
  exit 1
fi
if [ -z "$EXP" ]
then
  EXP='9999999999'
fi
# issued at
if [ -z "$IAT" ]
then
  IAT='100000000'
fi
if [ -z "$ISS" ]
then
  ISS='generate-jwt-token.sh'
fi

header='{"alg": "HS256","typ": "JWT"}'
payload=$(cat <<-END
{
  "identityType": "user",
  "identityId": "${USER_ID}",
  "userId": "${USER_ID}",
  "encrypted": "",
  "exp": ${EXP},
  "iat": ${IAT},
  "iss": "${ISS}"
}
END
)

header_base64=$(echo "${header}" | printf '%s' "${1:-$(</dev/stdin)}" | jq -c . | printf '%s' "${1:-$(</dev/stdin)}" | base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n')
payload_base64=$(echo "${payload}" | printf '%s' "${1:-$(</dev/stdin)}" | jq -c . | printf '%s' "${1:-$(</dev/stdin)}" | base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n')
header_payload=$(echo "${header_base64}.${payload_base64}")
signature=$(echo "${header_payload}" | printf '%s' "${1:-$(</dev/stdin)}" | openssl dgst -binary -sha256 -hmac "${SECRET}" | printf '%s' "${1:-$(</dev/stdin)}" | base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n')
echo "${header_payload}.${signature}"
