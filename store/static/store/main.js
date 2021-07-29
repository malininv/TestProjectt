$(document).ready(() => {
    $('#input-main').submit((e) => {
        e.preventDefault()
        const req = $('#input-main').serialize()
        $.ajax({
            url: $('#main-wrapper').attr("data-ajax"),
            data: req,
            success: (response) => {
                let products = $(response).filter('.product-wrapper').html()
                let paginator = $(response).find('#next_button').attr('href')
                let paginator2 = $(response).find('#prev_button').attr('href')

                $('.product-wrapper').html(products)
                $('#next_button').attr("href", paginator)
                $('#prev_button').attr("href", paginator2)
                $('.breadcrumbs').empty()
            }
        })
    })

    $('#next_button').click((e) => {
        e.preventDefault()
        const req = $('#next_button').attr("href").slice(1)

       $.ajax({
            url: '',
            data: req,
            success: (response) => {
                let products = $(response).filter('.product-wrapper').html()
                let paginator = $(response).find('#next_button').attr('href')
                let paginator2 = $(response).find('#prev_button').attr('href')
                $('.product-wrapper').html(products)
                $('#next_button').attr("href", paginator)
                $('#prev_button').attr("href", paginator2)

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
                let paginator = $(response).find('#next_button').attr('href')
                let paginator2 = $(response).find('#prev_button').attr('href')
                $('.product-wrapper').html(products)
                $('#next_button').attr("href", paginator)
                $('#prev_button').attr("href", paginator2)

            }
        })
    })

    // function ajax(req, url) {
    //     $.ajax({
    //         url: $('#main-wrapper').attr("data-url"),
    //         data: req,
    //         success: (response) => {
    //             let products = $(response).filter('.product-wrapper').html()
    //             let paginator = $(response).find('#next_button').attr('href')
    //             let paginator2 = $(response).find('#prev_button').attr('href')
    //             $('.product-wrapper').html(products)
    //             $('#next_button').attr("href", paginator)
    //             $('#prev_button').attr("href", paginator2)
    //
    //         }
    //     })
    // }
})
