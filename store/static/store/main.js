$(document).ready(() => {
    $('#input-main').submit((e) => {
        e.preventDefault()
        const req = $('#input-main').serialize()
        $.ajax({
            url: url,
            data: req,
            success: (response) => {
                $('.product-wrapper').html(response)
            }
        })
        history.replaceState(null, null, `?${req}`);
    })
})
