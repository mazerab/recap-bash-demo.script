ACCESS_TOKEN=$ACCESS_TOKEN

POST_PHOTOSCENE_URL='https://developer.api.autodesk.com/photo-to-3d/v1/photoscene/'${PHOTOSCENE_ID}

echo 'Submitting photoscene'

curl -s -w "\n%{http_code}" $POST_PHOTOSCENE_URL \
  -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" | {
    read body
    read code
    echo $code
    echo $body
    jq .Photoscene <<< "$body"
}
