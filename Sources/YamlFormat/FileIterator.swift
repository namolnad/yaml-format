import Foundation

struct FileIterator {
    private let fileManager: FileManager = .default

    private var cwd: URL { .init(fileURLWithPath: fileManager.currentDirectoryPath) }

    let fileTypes: [String]

    let ignoredPaths: [String]

    func iterate(_ handler: (inout String) throws -> Void) throws {
        guard let enumerator = fileManager.enumerator(at: cwd, includingPropertiesForKeys: [.isRegularFileKey], options: [.skipsHiddenFiles, .skipsPackageDescendants]) else {
            fatalError()
        }

        for case let fileUrl as URL in enumerator where fileTypes.contains(fileUrl.pathExtension) {
            guard !ignoredPaths.contains(where: { fileUrl.isChild(of: cwd.appendingPathComponent($0)) })  else {
                continue
            }
            var contents = try String(contentsOf: fileUrl)
            do {
                try handler(&contents)
            } catch {
                print(error)
                print(fileUrl.absoluteString)
            }
            try contents.write(to: fileUrl, atomically: true, encoding: .utf8)
        }
    }
}

private extension URL {
    func isChild(of url: URL) -> Bool {
        zip(pathComponents, url.pathComponents).allSatisfy(==)
    }
}
