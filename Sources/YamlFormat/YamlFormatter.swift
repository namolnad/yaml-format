import Yams

public struct YamlFormatter {
    public static func format(_ string: String) throws -> String? {
        guard let yaml = try Yams.compose(yaml: string) else { return nil }
        return try Yams.serialize(node: yaml, indent: 2, sortKeys: true)
    }
}
