import ArgumentParser

struct FormatCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(commandName: "yaml-format")
    }

    @Option(name: [.short, .customLong("ignore-path")])
    var ignoredPaths: [String]

    mutating func run() throws {
        try FileIterator(fileTypes: ["yml", "yaml"], ignoredPaths: ignoredPaths).iterate { string in
            guard let result = try YamlFormatter.format(string) else { return }
            string = result
        }
    }
}
