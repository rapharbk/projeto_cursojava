/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.RelatorioModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macuser
 */
public class Relatorio {

    private static Relatorio relatorio = null;

    public static final Relatorio getInstance() {
        if (relatorio == null) {
            relatorio = new Relatorio();
        }
        return relatorio;
    }

    public List<RelatorioModel> obterPessoasCadastradas(Connection conn) throws SQLException {
        List<RelatorioModel> listaPessoasCadastradas = new ArrayList<>();
        String query = "select p.id, p.nome, p.data_nascimento, p.sexo, p.email, "
                + " p.my_number, t.numero, t.tipo_telefone, e.provincia, e.cidade, e.ds_endereco, e.cep, e.bairro"
                + " from pessoa p, telefone t, endereco e"
                + " where p.id = t.id_pessoa"
                + " and p.id = e.id_pessoa"
                + " order by p.nome";
        
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        while(rs.next()) {
            RelatorioModel newModel = new RelatorioModel();
            newModel.setIdPessoa(rs.getInt("id"));
            newModel.setNomePessoa(rs.getString("nome"));
            newModel.setDataNascimento(rs.getString("data_nascimento"));
            newModel.setSexo(rs.getString("sexo"));
            newModel.setEmail(rs.getString("email"));
            newModel.setMyNumber(rs.getString("my_number"));
            newModel.setNumeroTelefone(rs.getString("numero"));
            newModel.setTipoTelefone(rs.getString("tipo_telefone"));
            newModel.setProvincia(rs.getString("provincia"));
            newModel.setCidade(rs.getString("cidade"));
            newModel.setEndereco(rs.getString("ds_endereco"));
            newModel.setCep(rs.getString("cep"));
            newModel.setBairro(rs.getString("bairro"));
            
            listaPessoasCadastradas.add(newModel);
        }
        rs.close();
        prep.close();
        
        return listaPessoasCadastradas;
    }

}