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
                $('#main-wrapper').attr("data-is-ajax", 'true')
            }
        })
    })

    $('#next_button').click((e) => {
        e.preventDefault()

        const req = $('#next_button').attr("href").slice(1)
        if ($('#main-wrapper').attr("data-is-ajax")) {
            url = $('#main-wrapper').attr("data-ajax")
        } else {
            url = ''
        }
        $.ajax({
            url: url,
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

        if ($('#main-wrapper').attr("data-is-ajax")) {
            url = $('#main-wrapper').attr("data-ajax")
        } else {
            url = ''
        }
        $.ajax({
            url: url,
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
})
