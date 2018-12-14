ACCESS_TOKEN=$ACCESS_TOKEN

PHOTOSCENE_URL='https://developer.api.autodesk.com/photo-to-3d/v1/photoscene/'${PHOTOSCENE_ID}

echo 'Requesting photoscene scenelink'

curl -s -w "\n%{http_code}" $PHOTOSCENE_URL \
  -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" | {
    read body
    read code
    echo $code
    echo $body
    jq .Photoscene <<< "$body"
}
