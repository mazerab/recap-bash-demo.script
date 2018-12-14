ACCESS_TOKEN=$ACCESS_TOKEN

POST_FILE_URL='https://developer.api.autodesk.com/photo-to-3d/v1/file'

echo 'Starting image uploads to the photoscene'

curl -s -w "\n%{http_code}" $POST_FILE_URL \
  -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -F photosceneid=$PHOTOSCENE_ID \
  -F type=image \
  -F file[0]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0033.JPG \
  -F file[1]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0034.JPG \
  -F file[2]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0035.JPG \
  -F file[3]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0036.JPG \
  -F file[4]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0037.JPG \
  -F file[5]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0038.JPG \
  -F file[6]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0039.JPG \
  -F file[7]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0040.JPG \
  -F file[8]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0041.JPG \
  -F file[9]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0042.JPG \
  -F file[10]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0043.JPG | {
    read body
    read code
    echo $code
    jq .Files <<< "$body"
}

