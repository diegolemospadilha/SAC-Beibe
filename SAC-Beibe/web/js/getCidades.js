$(document).ready(function () {
    $("#estado").change(function () {
        getCidades();
    });
});

function getCidades() {
    var estadoId = $("#estado").val();
    var url = "AjaxServlet";
    $.ajax({
        url: url, // URL da sua Servlet
        data: {
            estadoId: estadoId
        }, // Parâmetro passado para a Servlet
        dataType: 'json',
        success: function (data) {
            // Se sucesso, limpa e preenche a combo de cidade
            // alert(JSON.stringify(data));
            $("#cidade").empty();
            $.each(data, function (i, obj) {
                $("#cidade").append('<option value=' + obj.idCidade + '>' + obj.nomeCidade + '</option>');
            });
        },
        error: function (request, textStatus, errorThrown) {
            alert(request.status + ', Error: ' + request.statusText);
            // Erro
        }
    });
}


