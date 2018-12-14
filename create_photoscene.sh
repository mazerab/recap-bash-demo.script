ACCESS_TOKEN=$ACCESS_TOKEN

POST_PHOTOSCENE_URL='https://developer.api.autodesk.com/photo-to-3d/v1/photoscene'

echo 'Starting photoscene creation'

curl -s -w "\n%{http_code}" $POST_PHOTOSCENE_URL \
  -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -d scenename=demoscene \
  -d format=rcm,rcs,ortho \
  -d metadata_name[0]=orthogsd \
  -d metadata_value[0]=0.1 \
  -d metadata_name[1]=targetcs \
  -d metadata_value[1]=UTM84-32N | {
    read body
    read code
    echo $code
    jq .Photoscene <<< "$body"
}
