// 获取所有的滑动图片元素
const sliderItems = document.querySelectorAll('.slider-item');

// 循环遍历所有滑动图片元素
sliderItems.forEach(function(sliderItem) {

    // 给每个滑动图片元素绑定鼠标移入事件
    sliderItem.addEventListener('mouseenter', function() {

        // 计算当前元素的宽度和高度
        const width = this.offsetWidth;
        const height = this.offsetHeight;

        // 计算当前元素的左上角坐标
        const rect = this.getBoundingClientRect();
        const left = rect.left;
        const top = rect.top;

        // 创建一个高亮框元素并设置样式
        const highlightBox = document.createElement('div');
        highlightBox.style.position = 'fixed';
        highlightBox.style.width = width + 'px';
        highlightBox.style.height = height + 'px';
        highlightBox.style.left = left + 'px';
        highlightBox.style.top = top + 'px';
        highlightBox.style.border = '5px solid #ffffff';
        highlightBox.style.borderRadius = '10px';
        highlightBox.style.boxShadow = '0 0 10px #ffffff';

        // 将高亮框元素添加到页面中
        document.body.appendChild(highlightBox);

        // 计算高亮框的最终尺寸和位置
        const finalWidth = width * 1.2;
        const finalHeight = height * 1.2;
        const finalLeft = left - ((finalWidth - width) / 2);
        const finalTop = top - ((finalHeight - height) / 2);

        // 执行动画效果，让高亮框逐渐变大并移到目标位置
        highlightBox.animate([
            { width: width + 'px', height: height + 'px', left: left + 'px', top: top + 'px' },
            { width: finalWidth + 'px', height: finalHeight + 'px', left: finalLeft + 'px', top: finalTop + 'px' }
        ], {
            duration: 500,
            easing: 'ease-out'
        });
    });

    // 给每个滑动图片元素绑定鼠标移出事件
    sliderItem.addEventListener('mouseleave', function() {

        // 获取当前页面上的高亮框元素
        const highlightBox = document.querySelector('.highlight-box');

        // 如果高亮框存在，则将其删除
        if (highlightBox) {
            document.body.removeChild(highlightBox);
        }
    });
});
