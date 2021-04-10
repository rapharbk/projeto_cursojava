/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import static com.app.action.IDRAction.connectionPool;
import com.app.dao.VeiculoDAO;
import com.app.model.VeiculoModel;
import com.app.util.Errors;
import java.sql.Connection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author macuser
 */
public class NomeVeiculoAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("carregarMarcaVeiculo")) {
            this.carregarMarcaVeiculo(form, request, errors);
        } else if (action.equals("save")) {
            this.save(form, request, errors);
        } else if (action.equals("excluir")) {
            this.excluir(form, request, errors);
        }
        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        VeiculoModel veiculoModel = new VeiculoModel();
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter lista dos tipos de veiculos
            List<VeiculoModel> listaTipoVeiculo = VeiculoDAO.getInstance().obterListaTipoVeiculos(conn);
            session.setAttribute("listaTipoVeiculo", listaTipoVeiculo);

            request.setAttribute("VeiculoModel", veiculoModel);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void carregarMarcaVeiculo(ActionForm form, HttpServletRequest request, Errors errors) {
        VeiculoModel veiculoModel = (VeiculoModel) form;
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

//            //obter lista das marcas de veiculos ja cadastradas
            List<VeiculoModel> listaMarcaVeiculo = VeiculoDAO.getInstance().obterListaMarcaVeiculoPorTipo(conn, veiculoModel.getIdTipoVeiculo());
            session.setAttribute("listaMarcaVeiculo", listaMarcaVeiculo);
        
            request.setAttribute("VeiculoModel", veiculoModel);
        
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void save(ActionForm form, HttpServletRequest request, Errors errors) {
        VeiculoModel veiculoModel = (VeiculoModel) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //validar se a marca ja existe cadastrada
            boolean isExisteMarca = VeiculoDAO.getInstance().isExisteMarcaVeiculo(conn, veiculoModel.getDsMarcaVeiculo(), veiculoModel.getIdTipoVeiculo());
            if (!isExisteMarca) {
                //se nao existe pode realizar o cadastro
                VeiculoDAO.getInstance().saveMarcaVeiculo(conn, veiculoModel);
                veiculoModel.setDsMarcaVeiculo(null);
                errors.error("Marca de Veiculo cadastrada!!");
            } else {
                //caso exista nao cadastra e manda mensagem na tela
                errors.error("Esssa Marca de Veiculo já encontra-se cadastrada!!");
            }
            this.page(form, request, errors);
            request.setAttribute("VeiculoModel", veiculoModel);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }

    }

    private void excluir(ActionForm form, HttpServletRequest request, Errors errors) {
        VeiculoModel veiculoModel = (VeiculoModel) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //excluir marca do veiculo
            VeiculoDAO.getInstance().excluirMarcaVeiculo(conn, veiculoModel.getIdMarcaVeiculo());
            errors.error("Marca de Veículo Excluída com Sucesso!!");
            this.page(form, request, errors);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
