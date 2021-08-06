$(document).ready(() => {
    $(".trigger_popup_fricc").click(() => {
        $('.hover_bkgr_fricc').toggle()
    })

    $('.popupCloseButton').click(() => {
        $('.hover_bkgr_fricc').hide()
    })
})