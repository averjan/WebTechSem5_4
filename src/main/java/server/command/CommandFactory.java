package server.command;

import server.command.impl.HomeCommand;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class CommandFactory {
    private static final Map<String, Command> commands = new HashMap<>();
    private static final CommandFactory instance = new CommandFactory();

    private CommandFactory() {
        commands.put(CommandsNames.HOME_COMMAND, new HomeCommand());
    }

    public static CommandFactory getInstance() {
        return CommandFactory.instance;
    }

    public Command getCommand(String name) {
        return Optional.ofNullable(commands.get(name)).orElse(commands.get(CommandsNames.HOME_COMMAND));
    }
}
