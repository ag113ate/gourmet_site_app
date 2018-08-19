$(function(){
  
  // 背景画像をスライドで表示
  (function(){
    // 表示サイズの設定（画面サイズに合わせる）
    var disp_height = $(window).height();
    var disp_width = $(window).width();
    var setting_str = disp_width + 'px' + ' ' + disp_height + 'px';
    $('#container').css('background-size', setting_str);
    
    // スライド処理の設定
    $('#container').bgSwitcher({
        images: [
          '/images/store_pict1.jpg',
          '/images/store_pict2.jpg',
          '/images/store_pict3.jpg'], // 切替背景画像を指定
    });
  })();
  

  // 各料理画像の表示エリアについて、高さを設定（表示エリアの幅と同サイズにする）
  // ※ positionプロパティを使用し表示しているため、高さがない状態となっている。
  //    そのため、本処理により高さを設定する必要がある
  (function(){
    var img_area_num = $('.image_area').length;
    
    // 各料理画像エリアについて、高さを設定
    for (var loop1 = 0; loop1 < img_area_num; loop1++){
      var height = $('.image_area').eq(loop1).width();
      $('.image_area').eq(loop1).height(height);
    }
  })();
  
  
  // 来店日欄の設定（開始）
  (function(){
    // ====================================================================
    //                       翌日の日付を設定を設定
    // ====================================================================
    var min_date = new Date();
    min_date.setDate(min_date.getDate() + 1);
    var min_yyyy = min_date.getFullYear().toString(10);
    var min_mm = ("0" + (min_date.getMonth() + 1)).slice(-2);
    var min_dd = ("0" + min_date.getDate()).slice(-2);
    var min_yyyy_mm_dd = min_yyyy + "-" + min_mm + "-" + min_dd;
    $('#visit_date').attr('min', min_yyyy_mm_dd);
    
    // ====================================================================
    //                      30日後の日付を設定を設定
    // ====================================================================
    var max_date = new Date();
    max_date.setDate(max_date.getDate() + 30);
    var max_yyyy = max_date.getFullYear().toString(10);
    var max_mm = ("0" + (max_date.getMonth() + 1)).slice(-2);
    var max_dd = ("0" + max_date.getDate()).slice(-2);
    var max_yyyy_mm_dd = max_yyyy + "-" + max_mm + "-" + max_dd;
    $('#visit_date').attr('max', max_yyyy_mm_dd);
  }
  )();
  
  
  // 各料理画像をスライドで表示
  (function(){
    var img_areas = $('.image_area');
    var img_areas_num = img_areas.length;
    var current_img_no = new Array(img_areas_num);
    
    
    // ====================================================================
    //                            初期設定
    // =========================== begin ==================================
    // 一旦、全ての料理画像を非表示とする
    $('.image_area img').css('display', 'none');
    
    // 料理画像の各表示領域について1枚のみ表示
    for (var loop1 = 0; loop1 < current_img_no.length; loop1++){
      current_img_no[loop1] = 0;
      img_areas.eq(loop1).find('img').eq(0).css('display', 'block');
    }
    // ============================ end ===================================
    
    // 表示している料理画像を切り替え
    function changeSlides(imgs, img_num, img_area_no){
      
      //　次の表示画像の番号を求める
      var next_img_no = current_img_no[img_area_no] + 1;
      if (next_img_no >= img_num){
        next_img_no = 0;
      }
      
      // 画像の切り替え
      imgs.eq(current_img_no[img_area_no]).fadeOut(2000);
      imgs.eq(next_img_no).fadeIn(2000);
      
      // 表示している画像番号を更新
      current_img_no[img_area_no] = next_img_no;
    }
    
    // ====================================================================
    // 　料理画像の各表示領域について、画像を切り替える間隔の設定や、
    //   各表示領域に用意されている画像枚数を取得
    // =========================== begin ==================================
    var interval_msec = new Array(img_areas_num);
    var imgs = new Array(img_areas_num);
    var img_num = new Array(img_areas_num);
    
    for (var loop1 = 0; loop1 < img_areas_num; loop1++){
      interval_msec[loop1] = Math.floor((Math.random() * (6 - 3) + 3) * 1000);
      imgs[loop1] = img_areas.eq(loop1).find('img');
      img_num[loop1] = imgs.length;
    }
    // ============================ end ===================================
    
    // 料理画像を一定間隔で切り替え
    setInterval(function(){changeSlides(imgs[0], img_num[0], 0)}, interval_msec[0]);
    setInterval(function(){changeSlides(imgs[1], img_num[1], 1)}, interval_msec[1]);
    setInterval(function(){changeSlides(imgs[2], img_num[2], 2)}, interval_msec[2]);
  })();


  // 予約情報のチェック
  $('#reserve_button').click(function(){
    // 予約日、予約人数、予約時間それぞれのエラーメッセージ
    var date_err_msg, people_err_msg, time_err_msg; 
    
    date_err_msg = people_err_msg = time_err_msg = '';
    
    // ====================================================================
    //                        来店日欄のチェック
    // ====================================================================
    var date_chk = (function(){
      // -------------------------------------------------------------
      //                     チェック1： 空チェック
      // ---------------------------- begin --------------------------
      if ($('#visit_date').val() === ""){
        date_err_msg = "予約日を設定してください。";
        return false;
      }
      // ---------------------------- end ----------------------------
      
      // -------------------------------------------------------------
      //       チェック2： 設定日が翌日から30日以内になっているか
      // ---------------------------- begin --------------------------
      var set_date = new Date($('#visit_date').val());
      
      // 翌日の日付を取得
      var min_date = new Date();
      min_date.setDate(min_date.getDate() + 1);
      
      // 30日後の日付を取得
      var max_date = new Date();
      max_date.setDate(max_date.getDate() +30);
      
      // 「日付のみ」による比較のため、「時、分、秒」の値はクリア
      set_date.setHours(0,0,0,0);
      min_date.setHours(0,0,0,0);
      max_date.setHours(0,0,0,0);
      
      // 指定期間内か、チェック
      if ((set_date < min_date) || (set_date > max_date)){
        date_err_msg = "予約日は翌日から30日以内です。";
        return false;
      }
      // ---------------------------- end ----------------------------

      // -------------------------------------------------------------
      //                チェック3： 設定日が休業日でないか
      // ---------------------------- begin --------------------------
      if (set_date.getDay() === 2){
        date_err_msg = "休業日以外で予約日をお願いします。";
        return false;
      }
      // ---------------------------- end ----------------------------
      
      // チェック項目をクリアしたため、trueを返却
      return true;
    })();
    
    
    // ====================================================================
    //                          来店人数のチェック
    // ====================================================================
    var people_chk = (function(){
      // 未選択かのチェック
      var select_val = $('#visit_people').val();
      if(select_val === "not_select"){
        people_err_msg = "予約人数を設定してください。";
        return false;
      }
      
      // チェックをクリアしたため、trueを返却
      return true;
    })();
      
    
    // ====================================================================
    //                        来店時間のチェック
    // ====================================================================
    var time_chk = (function(){
      var input_time_str = $('#visit_time').val();
      
      // -------------------------------------------------------------
      //                      チェック1：空チェック
      // ---------------------------- begin --------------------------
      if(input_time_str === ""){
        time_err_msg = "予約時間を設定してください。"
        return false;
      }
      // ---------------------------- end ----------------------------
      
      // -------------------------------------------------------------
      //                 チェック2： 営業時間内かのチェック
      // --------------------------- begin ---------------------------
      // 設定した時間を分のみの値へ変換
      var input_time_split_array= input_time_str.split(":");
      var set_minute_val = (parseInt(input_time_split_array[0]) * 60)
                           + parseInt(input_time_split_array[1]);
      
      // 予約の開始時間（営業開始時間）を分単位で求める
      var begin_minute_val = 11 * 60 + 30;
      
      // 予約の終了時間（終了時間の40分前）を分単位で求める。
      var end_minute_val = 20 * 60 + 20;
      
      // 時間内かチェック
      if ((set_minute_val < begin_minute_val) 
                     || (set_minute_val > end_minute_val)){
        time_err_msg = "予約は11:30~20:20分まででお願いします。";   
        return false;
      }
      // ---------------------------- end ----------------------------
     
      // チェック項目をクリアしたため、trueを返却
      return true;
    })();
    
    
    // ====================================================================
    //                           メッセージの表示
    // ====================================================================
    if ((date_chk === true) && (people_chk == true) && (time_chk == true)){
      // 中央寄せで予約の完了メッセージを表示
      //（前の操作でエラーメッセージが表示された場合、左寄せとなっている。
      //  一度、この設定をクリアする）
      $('#reserve_msg').removeClass('put_left');
      $('#reserve_msg').addClass('put_center');
      $('#reserve_msg').html(
        '<span class="background_orange put_center">上記内容で予約しました。</span>');
    }else{
      // -------------------------------------------------------------
      //                      エラーメッセージを表示
      // --------------------------- begin ---------------------------
      // メッセージの生成（箇条書き用のhtml生成）
      var warm_msg = "<ul class='items_circle'>";
      warm_msg += (date_chk === false) ? ("<li>" + date_err_msg + "</li>") : ("");
      warm_msg += (people_chk === false) ? ("<li>" + people_err_msg + "</li>") : ("");
      warm_msg += (time_chk === false) ? ("<li>" + time_err_msg + "</li>") : ("");
      warm_msg += ("</ul>")
      
      // 左寄せでメッセージ表示
      $('#reserve_msg').addClass('put_left');
      warm_msg='<span class="font_red">'+warm_msg+'</span>';
      $('#reserve_msg').html(warm_msg);
      // ---------------------------- end ----------------------------
    }
  });
  
});

