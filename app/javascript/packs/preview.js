// 条件分岐して、JavaScriptのコードを実行するページをnewとeditに限定
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {

  // HTMLが最初に読み込まれたときに動作する関数を定義
  document.addEventListener('DOMContentLoaded', function(){

    // 画像を表示するためのHTMLの要素を、JavaScript側で取得
    const imageList = document.getElementById('image-list');

    // 値の変化が起こったときに呼び出される関数を定義
    document.getElementById('mask_image').addEventListener('change', function(e){

      const imageContent = document.querySelector('img');
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      if (imageContent){
        imageContent.remove();
      }
      // 画像の情報は、e.target.files[0]として格納されているオブジェクトから取得
      const file = e.target.files[0];
      // 取得できた画像情報をプレビューとして表示させるために、img要素に付与するsrc属性のURLを生成
      const blob = window.URL.createObjectURL(file);

      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');

      // 表示するimg要素を生成
      const blobImage = document.createElement('img');

      // 画像情報を生成したimg要素のsrc属性に指定します。
      blobImage.setAttribute('src', blob);

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      // <div><img></div>
      imageList.appendChild(imageElement);
      // id = <image-list>
      //        <div>
      //          <img></img>
      //        </div>
      //      </image-list>
    });
  });
}