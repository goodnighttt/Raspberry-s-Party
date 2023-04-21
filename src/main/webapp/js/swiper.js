 var mySwiper = new Swiper(".swiper", {
        // autoplay: {//设置自动切换，可以更改切换时间
          // delay: 2000,
        // },
        loop: true, // 循环模式选项
        effect: 'cards',//设置切换的方式

        // 如果需要分页器
        pagination: {
          el: ".swiper-pagination",
          clickable :true,//设置小圆点点击切换图片
        },

        // 如果需要前进后退按钮
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
