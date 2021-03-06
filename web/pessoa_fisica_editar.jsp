<%-- 
    Document   : pessoa_fisica_editar
    Created on : 20/fev/2021, 9:49:55
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">
            function fAtualizar() {
                var nome = document.getElementById("nome").value;
                var email = document.getElementById("email").value;
                var sexo = document.getElementById("sexo").value;
                var myNumber = document.getElementById("myNumber").value;
                var provincia = document.getElementById("provincia").value;
                var cidade = document.getElementById("cidade").value;
                var dataNascimento = document.getElementById("dataNascimento").value;
                var dsEndereco = document.getElementById("dsEndereco").value;
                var bairro = document.getElementById("bairro").value;
                var cep = document.getElementById("cep").value;
                var tipoTelefone = document.getElementById("tipoTelefone").value;
                var nrTelefone = document.getElementById("nrTelefone").value;

                if (nome.length < 5) {
                    alert("Deve ser informado o nome corretamente!!");
                    document.getElementById("nome").focus();
                } else if (email.search('@') < 0) {
                    alert("Deve ser informado o e-mail corretamente!!");
                    document.getElementById("email").focus();
                } else if (sexo === "") {
                    alert("Deve ser informado o Sexo corretamente!!");
                    document.getElementById("sexo").focus();
                } else if (myNumber === "") {
                    alert("Deve ser informado o MyNumber corretamente!")
                    document.getElementById("myNumber").focus();
                } else if (provincia === "") {
                    alert("Deve ser informado a Provincia corretamente!!");
                    document.getElementById("provincia").focus();
                } else if (cidade.length < 2) {
                    alert("Deve ser informado a Cidade corretamente!!");
                    document.getElementById("cidade").focus();
                } else if (dataNascimento.length < 5) {
                    alert("Deve ser informado a Data de Nascimento corretamente!!");
                    document.getElementById("dataNascimento").focus();
                } else if (dsEndereco.length < 5) {
                    alert("Deve ser informado o Endere?o corretamente!!");
                    document.getElementById("dsEndereco").focus();
                } else if (bairro.length < 3) {
                    alert("Deve ser informado o Bairro corretamente!!");
                    document.getElementById("bairro").focus();
                } else if (cep.length < 3) {
                    alert("Deve ser informado o CEP corretamente!!");
                    document.getElementById("cep").focus();
                } else if (tipoTelefone === "") {
                    alert("Deve ser informado o Tipo de Telefone corretamente!!");
                    document.getElementById("tipoTelefone").focus();
                } else if (nrTelefone.length < 6) {
                    alert("Deve ser informado o Telefone corretamente!!");
                    document.getElementById("nrTelefone").focus();
                } else {
                    document.PessoaFisicaModel.action = "PessoaFisica.do?action=atualizar&dataNascimento=" + dataNascimento;
                    document.PessoaFisicaModel.submit();
                }

            }

            function fVoltar() {
                document.PessoaFisicaModel.action = "PessoaFisica.do?action=pagePesquisa";
                document.PessoaFisicaModel.submit();
            }
        </script>

    </head>
    <body>

        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <jsp:include page="topo.jsp"/>

        <div align="center">
            <h1>Editar Dados da Pessoa F?sica</h1>
            <hr/>
        </div>
        <html:form action="PessoaFisica">
            <bean:define name="PessoaFisicaModel" property="endereco" id="EnderecoModel"/>
            <bean:define name="PessoaFisicaModel" property="telefone" id="TelefoneModel"/>
            <html:hidden name="PessoaFisicaModel" property="id"/>
            <table width="80%" border="0" align="center" class="table-condensed">
                <tr>
                    <td width="50%">
                        <div class="col-lg-12">
                            Nome:
                            <html:text styleClass="form-control" name="PessoaFisicaModel" property="nome" styleId="nome"/>        
                        </div>
                    </td>
                    <td width="50%" colspan="2">
                        <div class="col-lg-12">
                            E-mail:
                            <html:text styleClass="form-control" name="PessoaFisicaModel" property="email" styleId="email"/>        
                        </div>
                    </td>
                </tr>
            </table>
            <table width="80%" border="0" align="center" class="table-condensed">
                <tr>
                    <td width="33%">
                        <div class="col-lg-12">
                            Data de Nascimento:
                            <input type="date" class="form-control" id="dataNascimento" value="<bean:write name="PessoaFisicaModel" property="dataNascimento"/>"/>
                        </div>
                    </td>
                    <td width="33%">
                        <div class="col-lg-12">
                            Sexo:
                            <html:select styleClass="form-control" name="PessoaFisicaModel" property="sexo" styleId="sexo">
                                <html:option value="">Selecione</html:option>
                                <html:option value="M">Masculino</html:option>
                                <html:option value="F">Feminino</html:option>
                            </html:select>
                        </div>
                    </td>
                    <td width="33%">
                        <div class="col-lg-12">
                            My Number:
                            <html:text styleClass="form-control" name="PessoaFisicaModel" property="myNumber" styleId="myNumber"/>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td width="33%">
                        <div class="col-lg-12">
                            CEP:
                            <html:text styleClass="form-control" name="EnderecoModel" property="cep" styleId="cep"/>
                        </div>
                    </td>
                    <td width="33%">
                        <div class="col-lg-12">
                            Prov?ncia:
                            <html:select name="EnderecoModel" property="provincia" styleId="provincia" styleClass="form-control">
                                <html:option value="">Selecione</html:option>
                                <html:option value="AICHI">AICHI</html:option>
                                <html:option value="AKITA">AKITA</html:option>
                                <html:option value="AOMORI">AOMORI</html:option>
                                <html:option value="CHIBA">CHIBA</html:option>
                                <html:option value="EHIME">EHIME</html:option>
                                <html:option value="FUKUI">FUKUI</html:option>
                                <html:option value="FUKUOKA">FUKUOKA</html:option>
                                <html:option value="FUKUSHIMA">FUKUSHIMA</html:option>
                                <html:option value="GIFU">GIFU</html:option>
                                <html:option value="GUNMA">GUNMA</html:option>
                                <html:option value="HIROSHIMA">HIROSHIMA</html:option>
                                <html:option value="HOKKAIDO">HOKKAIDO</html:option>
                                <html:option value="HYOGO">HYOGO</html:option>
                                <html:option value="IBARAKI">IBARAKI</html:option>
                                <html:option value="ISHIKAWA">ISHIKAWA</html:option>
                                <html:option value="IWATE">IWATE</html:option>
                                <html:option value="KAGAWA">KAGAWA</html:option>
                                <html:option value="KAGOSHIMA">KAGOSHIMA</html:option>
                                <html:option value="KANAGAWA">KANAGAWA</html:option>
                                <html:option value="KOCHI">KOCHI</html:option>
                                <html:option value="KUMAMOTO">KUMAMOTO</html:option>
                                <html:option value="KYOTO">KYOTO</html:option>
                                <html:option value="MIE">MIE</html:option>
                                <html:option value="MIYAGI">MIYAGI</html:option>
                                <html:option value="MIYAZAKI">MIYAZAKI</html:option>
                                <html:option value="NAGANO">NAGANO</html:option>
                                <html:option value="NAGASAKI">NAGASAKI</html:option>
                                <html:option value="NARA">NARA</html:option>
                                <html:option value="NIIGATA">NIIGATA</html:option>
                                <html:option value="OITA">OITA</html:option>
                                <html:option value="OKAYAMA">OKAYAMA</html:option>
                                <html:option value="OKINAWA">OKINAWA</html:option>
                                <html:option value="OSAKA">OSAKA</html:option>
                                <html:option value="SAGA">SAGA</html:option>
                                <html:option value="SAITAMA">SAITAMA</html:option>
                                <html:option value="SHIGA">SHIGA</html:option>
                                <html:option value="SHIMANE">SHIMANE</html:option>
                                <html:option value="SHIZUOKA">SHIZUOKA</html:option>
                                <html:option value="TOCHIGI">TOCHIGI</html:option>
                                <html:option value="TOKUSHIMA">TOKUSHIMA</html:option>
                                <html:option value="T?QUIO">T?QUIO</html:option>
                                <html:option value="TOTTORI">TOTTORI</html:option>
                                <html:option value="TOYAMA">TOYAMA</html:option>
                                <html:option value="WAKAYAMA">WAKAYAMA</html:option>
                                <html:option value="YAMAGATA">YAMAGATA</html:option>
                                <html:option value="YAMAGUCHI">YAMAGUCHI</html:option>
                                <html:option value="YAMANASHI">YAMANASHI</html:option>
                            </html:select>
                        </div>
                    </td>
                    <td width="33%">
                        <div class="col-lg-12">
                            Cidade:
                            <html:text styleClass="form-control" name="EnderecoModel" property="cidade" styleId="cidade"/>        
                        </div>
                    </td>
                </tr>
            </table>
            <table width="80%" border="0" align="center" class="table-condensed">
                <tr>
                    <td width="50%">
                        <div class="col-lg-12">
                            Endere?o:
                            <html:text styleClass="form-control" name="EnderecoModel" property="dsEndereco" styleId="dsEndereco"/>   
                        </div>
                    </td>
                    <td width="50%">
                        <div class="col-lg-12">
                            Bairro:
                            <html:text styleClass="form-control" name="EnderecoModel" property="bairro" styleId="bairro"/>        
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="col-lg-12">
                            Tipo Telefone:
                            <html:select name="TelefoneModel" property="tipoTelefone" styleId="tipoTelefone" styleClass="form-control">
                                <html:option value="">Selecione</html:option>
                                <html:option value="celular">CELULAR</html:option>
                                <html:option value="comercial">COMERCIAL</html:option>
                                <html:option value="residencial">RESIDENCIAL</html:option>
                            </html:select>
                        </div>
                    </td>
                    <td>
                        <div class="col-lg-12">
                            N?mero Telefone:
                            <html:text styleClass="form-control" name="TelefoneModel" property="nrTelefone" styleId="nrTelefone"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <input class="btn btn-success" type="button" value="ATUALIZAR" onClick="fAtualizar();">
                        <input class="btn btn-default" type="button" value="VOLTAR" onClick="fVoltar();">
                    </td>
                </tr>
            </table>
        </html:form>
    </body>
</html>
