$(document).ready(() => {
    $('#input-main').submit((e) => {
        e.preventDefault()
        const req = $('#input-main').serialize()
        $.ajax({
            url: $('#main-wrapper').attr("data-url"),
            data: req,
            success: (response) => {
                let products = $(response).filter('.product-wrapper')
                let paginator = $(response).find('#next_button').attr('href')
                $('.product-wrapper').html(products)
                $('#next_button').attr("href", paginator)
                history.replaceState(null, null, `?${req}`);
            }
        })
    })

    $('#next_button').click((e) => {
        e.preventDefault()
        const req = $('#next_button').attr("href").slice(1)
        $.ajax({
            url: $('#main-wrapper').attr("data-url"),
            data: req,
            success: (response) => {
                let products = $(response).filter('.product-wrapper').html()
                let paginator = $(response).find('#next_button').attr('href')
                let paginator2 = $(response).find('#prev_button').attr('href')
                $('.product-wrapper').html(products)
                $('#next_button').attr("href", paginator)
                $('#prev_button').attr("href", paginator2)
                history.replaceState(null, null, `?${req}`);
            }
        })
    })

    $('#prev_button').click((e) => {
        e.preventDefault()
        const req = $('#prev_button').attr("href").slice(1)
        $.ajax({
            url: $('#main-wrapper').attr("data-url"),
            data: req,
            success: (response) => {
                let products = $(response).filter('.product-wrapper').html()
                let paginator = $(response).find('#prev_button').attr('href')
                $('.product-wrapper').html(products)
                $('#prev_button').attr("href", paginator)
                history.replaceState(null, null, `?${req}`);
            }
        })
    })

})
