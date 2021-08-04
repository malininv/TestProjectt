$(document).ready(() => {
    $('#input-main').submit((e) => {
        e.preventDefault()
        let req = $('#input-main').serialize()
        $.ajax({
            url: $('#main-wrapper').attr("data-ajax"),
            data: req,
            success: (response) => {
                $('.product-wrapper').empty()
                $('.category input').removeAttr('checked')
                let pages = response.pop()
                req = pages['next_page']

                $('#next_button').attr("href", pages['next_page'])
                $('#prev_button').attr("href", pages['prev_page'])

                response.forEach(e => {
                    $('.product-wrapper').append(`

            <div class="product-item">
                <div class="product-name">${e['name']}</div>
                <img class="product-image" src="${e['image']}" alt="Какой-то продукт">
                <form method="POST" action="${$('#main-wrapper').attr("data-order-add")}">
<!--                {% csrf_token %}-->
                <input type="submit" value="Add to Cart">
                </form>
            </div>`)

                })
                $('#main-wrapper').attr("data-is-ajax", 'true')

            }
        })
    })

    $('#next_button').click((e) => {
        e.preventDefault()

        let req = $('#next_button').attr("href")
        if ($('#main-wrapper').attr("data-is-ajax")) {
            url = $('#main-wrapper').attr("data-ajax")
        } else {
            url = ''
        }
        $.ajax({
            url: url,
            data: req,
            success: (response) => {
                $('.product-wrapper').empty()
                let pages = response.pop()
                req = pages['next_page']

                $('#next_button').attr("href", pages['next_page'])
                $('#prev_button').attr("href", pages['prev_page'])

                response.forEach(e => {
                    $('.product-wrapper').append(`

            <div class="product-item">
                <div class="product-name">${e['name']}</div>
                <img class="product-image" src="${e['image']}" alt="Какой-то продукт">
                <form method="POST" action="${$('#main-wrapper').attr("data-order-add").slice(0, -2)}${e['id']}/">
<!--                {% csrf_token %}-->
                <input type="submit" value="Add to Cart">
                </form>
            </div>`)

                })


            }
        })
    })

    $('#prev_button').click((e) => {
        e.preventDefault()
        let req = $('#prev_button').attr("href")

        if ($('#main-wrapper').attr("data-is-ajax")) {
            url = $('#main-wrapper').attr("data-ajax")
        } else {
            url = ''
        }
        $.ajax({
            url: url,
            data: req,
            success: (response) => {
               $('.product-wrapper').empty()
                let pages = response.pop()
                req = pages['prev_page']

                $('#next_button').attr("href", pages['next_page'])
                $('#prev_button').attr("href", pages['prev_page'])

                response.forEach(e => {
                    $('.product-wrapper').append(`

            <div class="product-item">
                <div class="product-name">${e['name']}</div>
                <img class="product-image" src="${e['image']}" alt="Какой-то продукт">
                <form method="POST" action="${$('#main-wrapper').attr("data-order-add").slice(0, -2)}${e['id']}/">
<!--                {% csrf_token %}-->
                <input type="submit" value="Add to Cart">
                </form>
            </div>`)

                })


            }
        })
    })
})
