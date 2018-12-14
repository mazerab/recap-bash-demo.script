ACCESS_TOKEN=$ACCESS_TOKEN

POST_FILE_URL='https://developer.api.autodesk.com/photo-to-3d/v1/file'

echo 'Starting image uploads to the photoscene'

curl -s -w "\n%{http_code}" $POST_FILE_URL \
  -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -F photosceneid=$PHOTOSCENE_ID \
  -F type=image \
  -F file[0]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0044.JPG \
  -F file[1]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0045.JPG \
  -F file[2]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0046.JPG \
  -F file[3]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0048.JPG \
  -F file[4]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0049.JPG \
  -F file[5]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0050.JPG \
  -F file[6]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0051.JPG \
  -F file[7]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0052.JPG \
  -F file[8]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0053.JPG \
  -F file[9]=@/Users/mazerab/source/repos/getting-started-reality-capture-demo/images/DJI_0054.JPG | {
    read body
    read code
    echo $code
    jq .Files <<< "$body"
}

