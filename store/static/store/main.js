$(document).ready(() => {
    console.log()
    function getCookie(name) {
        let cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            const cookies = document.cookie.split(';');
            for (let i = 0; i < cookies.length; i++) {
                const cookie = cookies[i].trim();
                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }

    const csrftoken = getCookie('csrftoken');

    productForm()

    $('#input-main').submit((e) => {
        e.preventDefault()
        const req = $('#input-main').serialize()
        $.ajax({
            url: $('#main-wrapper').attr("data-ajax"),
            data: req,
            success: (response) => {

                $('.category input:checked').removeAttr('checked')
                $('.category label').removeClass('selected')
                let products = $(response['html']).filter('.product-wrapper').html()
                let paginator = $(response['html']).find('#next_button').attr('href')
                let paginator2 = $(response['html']).find('#prev_button').attr('href')
                $('.product-wrapper').html(products)
                $('#next_button').attr("href", paginator)
                $('#prev_button').attr("href", paginator2)
                $('.breadcrumbs').empty()
                $('#main-wrapper').attr("data-is-ajax", 'true')
                productForm()
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
                productForm()
                let products = $(response['html']).filter('.product-wrapper').html()
                let paginator = $(response['html']).find('#next_button').attr('href')
                let paginator2 = $(response['html']).find('#prev_button').attr('href')
                $('.product-wrapper').html(products)
                $('#next_button').attr("href", paginator)
                $('#prev_button').attr("href", paginator2)
                productForm()
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
                productForm()
                let products = $(response['html']).filter('.product-wrapper').html()
                let paginator = $(response['html']).find('#next_button').attr('href')
                let paginator2 = $(response['html']).find('#prev_button').attr('href')
                $('.product-wrapper').html(products)
                $('#next_button').attr("href", paginator)
                $('#prev_button').attr("href", paginator2)
                productForm()
            }
        })
    })

    function productForm() {
        $('.product-form').submit(e => {
            e.preventDefault()
//            $.ajax({
//                type: 'POST',
//                url: e.currentTarget.action,
//                data: {csrfmiddlewaretoken: csrftoken, 'quantity': e.currentTarget.quantity.value},
//                success: (response) => {
//                    console.log(response)
//                }
//            })
            arr = e.currentTarget.action.split('/')
            dict = {}
            dict['products'][arr[4]] = [arr[3]]
            document.cookie = `products=${dict}`

        })
    }
})
