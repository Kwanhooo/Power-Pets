$(function () {
    (function () {
        $('.add-to-cart-btn').click(function () {
            let pet_id = $(this).parent().parent().children(".pet_id").text();
            $.ajax({
                type: "GET",
                url: "cart?action=add-to-cart&petID=" + pet_id,
                success: function (data) {
                    console.log(data);
                    if (data === 'loginCertificateNeeded') {
                        window.location.href = "login";
                    } else {
                        $('.prompt_text').text('成功加入购物车啦，再去挑点别的吧！');
                        $('.mask').removeClass('hide');
                    }
                },
                error: function (data) {
                    console.log(data);
                    $('.prompt_text').text('加入购物车失败，过一会再试吧！');
                    $('.mask').removeClass('hide');
                }

            });
        })
        $('.prompt_sure,.prompt_cancel,.btn-OK').click(function () {
            $('.mask').addClass('hide');
        })
    })();
});
