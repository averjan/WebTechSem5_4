package server.command.impl;

import server.command.Command;
import server.command.CommandResult;
import server.command.context.RequestManager;

import javax.servlet.http.HttpServletResponse;

public class HomeCommand implements Command {
    private static final String PAGE = "WEB-INF/view/home.jsp";



    @Override
    public CommandResult execute(RequestManager request, HttpServletResponse response) {

        return CommandResult.forward(PAGE);
    }
}
