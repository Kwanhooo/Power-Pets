var addressStr;
var isInitData = false;

$(function () {
    (function () {
        $('#address-book-btn').click(function () {
            // let pet_id = $(this).parent().parent().children(".pet_id").text();
            $.ajax({
                type: "GET",
                url: "account?action=get-address-book",
                success: function (data) {
                    data = decodeURIComponent(data);
                    if (data === 'loginCertificateNeeded') {
                        window.location.href = "login";
                    } else {
                        //这里设置数据
                        setupDisplayTabs(data);
                        isInitData = true;
                        $('.mask').removeClass('hide').fadeIn();
                    }
                },
                error: function (data) {
                    console.log(data);
                    $('.prompt_text').text('数据请求失败，请稍后再试 ~');
                    $('.mask').removeClass('hide');
                }
            });
        })

        $('.prompt_sure,.prompt_cancel,.btn-OK').click(function () {
            $('.mask').addClass('hide');
        })
    })();
});

function saveChanges(index,isNew) {
    let consignee = $("#consignee_"+index).val();
    let city = $("#city_"+index).val();
    let address =$("#address_info_"+index).val();
    let contact = $("#contact_"+index).val();
    let strToSend = index+"@"+consignee+"#"+city+"#"+address+"#"+contact;
    console.log(strToSend);
    $.ajax({
        type: "GET",
        url:"account?action=update-address-book&data="+encodeURIComponent(strToSend),
        success:function () {
            console.log("更新地址簿成功");
            $('.mask').fadeOut().removeClass('hide');
        },
        error:function () {
            console.log("更新地址簿失败");
        }
    })
    if (isNew)
    {

    }
}

function setupDisplayTabs(data) {
    if (isInitData) return;
    addressStr = data;
    var addressArray = data.split("@");
    var tabs = $(".nav-tabs");
    var tabContents = $(".tab-content");
    for (let i = 0; i < addressArray.length-1; i++) {
        let infoArray = addressArray[i].split("#");
        //加标签栏
        let new_li;
        if (i === 0)
            new_li = $(" <li class=\"active\">\n" +
                "<a href=\"#address_" + (i + 1) + "\" data-toggle=\"tab\" style=\"font-size:20px\">地址1（默认）</a>\n" +
                "</li>");
        else
            new_li = $("<li>\n" +
                "<a href=\"#address_" + (i + 1) + "\" data-toggle=\"tab\" style=\"font-size:20px\">地址"+(i+1)+"</a>\n" +
                "</li>")
        tabs.append(new_li);

        //加对应的内容显示区域
        let new_display_div;
        if (i === 0)
            new_display_div = $("<div class=\"tab-pane active\" id=\"address_" + (i + 1) + "\">\n" +
                "</div>")
        else
            new_display_div = $("<div class=\"tab-pane \" id=\"address_" + (i + 1) + "\">\n" +
                "</div>")

        //在此插入获得信息
        let consignee = infoArray[0];
        let city = infoArray[1];
        let address = infoArray[2];
        let contact = infoArray[3];
        new_display_div.append($("" +
            "<div class=\"container\" style=\"max-width: 700px;position: fixed;left: 37%;margin-top: 10px;\">\n" +
            "    <div class=\"row clearfix\">\n" +
            "        <div class=\"col-md-8 column\">\n" +
            "            <h3 style=\"font-family: var(--font-family-sans-serif);\">📫 收货地址</h3><br>\n" +
            "            <strong>收货人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>\n" +
            "            <input type=\"text\" id=\"consignee_"+i+"\" name=\"consignee\" value=\""+consignee+"\"><br><br>\n" +
            "            <strong>省市地址&nbsp;&nbsp;&nbsp;&nbsp;</strong>\n" +
            "            <input type=\"text\" id=\"city_"+i+"\" name=\"city\" value=\""+city+"\"><br><br>\n" +
            "            <strong>详细地址&nbsp;&nbsp;&nbsp;&nbsp;</strong>\n" +
            "            <input type=\"text\" id=\"address_info_"+i+"\" name=\"address\" value=\""+address+"\"><br><br>\n" +
            "            <strong>联系电话&nbsp;&nbsp;&nbsp;&nbsp;</strong>\n" +
            "            <input type=\"text\" id=\"contact_"+i+"\" name=\"contact\" value=\""+contact+"\"><br><br>\n" +
            "        </div>\n" +
            "    </div>\n" +
            "    <div class=\"row clearfix\">\n" +
            "        <div class=\"col-md-8 column\">\n" +
            "            <button type=\"submit\" class=\"btn btn-lg btn-danger btn-block\"\n" +
            "                    style=\"max-width: 90%;margin-top: 10px;\" onclick=\"saveChanges("+(i)+",false"+");\">\n" +
            "                帮我保存吧\n" +
            "            </button>\n" +
            "        </div>\n" +
            "    </div>\n" +
            "</div>"))
        tabContents.append(new_display_div);
    }


    //加标签栏
    let new_li = $("<li>\n" +
            "<a href=\"#address_" + (addressArray.length) + "\" data-toggle=\"tab\" style=\"font-size:20px\">+</a>\n" +
            "</li>")
    tabs.append(new_li);

    //加对应的内容显示区域
    let new_display_div= $("<div class=\"tab-pane \" id=\"address_" + (addressArray.length) + "\">\n" +
            "</div>")

    //在此插入获得信息

    new_display_div.append($("" +
        "<div class=\"container\" style=\"max-width: 700px;position: fixed;left: 37%;margin-top: 10px;\">\n" +
        "    <div class=\"row clearfix\">\n" +
        "        <div class=\"col-md-8 column\">\n" +
        "            <h3 style=\"font-family: var(--font-family-sans-serif);\">📫 收货地址</h3><br>\n" +
        "            <strong>收货人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>\n" +
        "            <input type=\"text\" id=\"consignee_"+(addressArray.length-1)+"\" name=\"consignee\" value=\""+""+"\"><br><br>\n" +
        "            <strong>省市地址&nbsp;&nbsp;&nbsp;&nbsp;</strong>\n" +
        "            <input type=\"text\" id=\"city_"+(addressArray.length-1)+"\" name=\"city\" value=\""+""+"\"><br><br>\n" +
        "            <strong>详细地址&nbsp;&nbsp;&nbsp;&nbsp;</strong>\n" +
        "            <input type=\"text\" id=\"address_info_"+(addressArray.length-1)+"\" name=\"address\" value=\""+""+"\"><br><br>\n" +
        "            <strong>联系电话&nbsp;&nbsp;&nbsp;&nbsp;</strong>\n" +
        "            <input type=\"text\" id=\"contact_"+(addressArray.length-1)+"\" name=\"contact\" value=\""+""+"\"><br><br>\n" +
        "        </div>\n" +
        "    </div>\n" +
        "    <div class=\"row clearfix\">\n" +
        "        <div class=\"col-md-8 column\">\n" +
        "            <button type=\"submit\" class=\"btn btn-lg btn-danger btn-block\"\n" +
        "                    style=\"max-width: 90%;margin-top: 10px;\" onclick=\"saveChanges("+(addressArray.length-1)+",true"+");\">\n" +
        "                帮我保存吧\n" +
        "            </button>\n" +
        "        </div>\n" +
        "    </div>\n" +
        "</div>"))
    tabContents.append(new_display_div);
}