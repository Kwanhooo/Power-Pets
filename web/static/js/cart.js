function CartItem(item_id, item_amount) {
    this.itemID = item_id;
    this.itemAmount = item_amount;
}

function refreshTotalPrice() {
    var cartData = new Array();

    $('#cart-table tr').each(function (i) {// 遍历 tr
        if (i !== 0) {
            let item_id = (Number)($(this).attr("id"));
            let unit_price = 0;
            let amount = 0;

            $(this).children('td').each(function (j) {  //遍历 tr 的各个 td
                if (j === 2) {
                    unit_price = (Number)($(this).text());
                }
                if (j === 3) {
                    let input_amount = $(this).children().children().children(".col-md-6").children().children();
                    amount = (Number)(input_amount.val());
                }
                if (j === 4) {
                    $(this).text((unit_price * amount).toFixed(2));
                }

            });

            cartData[i - 1] = new CartItem(item_id, amount);
        }

    });

    refreshMyCart(JSON.stringify(cartData));

}

//字符串转base64
function encode(str) {
// 对字符串进行编码
    var encode = encodeURI(str);
// 对编码的字符串转化base64
    var base64 = btoa(encode);
    return base64;
}

function refreshMyCart(data) {
    console.log("refreshMyCart => " + data);


    $.ajax({
        type: "GET",
        url: "cart?action=update&data=" + encode(data),
        success: function (message) {
            if (message > 0) {
                console.log("成功更新了服务器数据：" + message);
            }
        },
        error: function (message) {
            console.log("更新服务器数据时出错：" + message);
        }
    });
}

$(function () {
    $('#cart-table tr').each(function (i) {// 遍历 tr
        let unit_price = 0;
        let amount = 0;

        $(this).children('td').each(function (j) {  //遍历 tr 的各个 td
            if (j === 2) {
                unit_price = (Number)($(this).text());
            }
            if (j === 3) {
                let input_amount = $(this).children().children().children(".col-md-6").children().children();
                amount = (Number)(input_amount.val());

                input_amount.change(function (e) {
                    if ($(this).val() < 0) {
                        $(this).val(0);
                    }
                    if ($(this).val > 100) {
                        $(this).val(100);
                    }
                    refreshTotalPrice();
                })

                let btn_add = $(this).children().children().children(".div-add").children();
                btn_add.click(function (e) {
                    if (amount >= 100)
                        return;
                    amount++;
                    input_amount.val(amount);
                    refreshTotalPrice();
                })


                let btn_minus = $(this).children().children().children(".div-minus").children();
                btn_minus.click(function (e) {
                    if (amount <= 0)
                        return;
                    amount--;
                    input_amount.val(amount);
                    refreshTotalPrice();
                })

            }
            if (j === 4) {
                $(this).text(((Number)(unit_price * amount)).toFixed(2));
            }

        });
    });
});