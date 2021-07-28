$(document).ready(() => {
    $('#input-main').submit((e) => {
        e.preventDefault()
        const req = $('#input-main').serialize()
        $.ajax({
            url: $('#main-wrapper').attr("data-url"),
            data: req,
            success: (response) => {
                $('.product-wrapper').html(response)
            }
        })
    })

    // $('#next_button').click((e) => {
    //     console.log('123')
    //     e.preventDefault()
    //     const req = $('#input-main').serialize() + $('#next_button').attr("data-page")
    //     console.log(req)
    //     $.ajax({
    //         url: $('#main-wrapper').attr("data-url"),
    //         data: req,
    //         success: (response) => {
    //             $('.product-wrapper').html(response)
    //         }
    //     })
    // })
})
