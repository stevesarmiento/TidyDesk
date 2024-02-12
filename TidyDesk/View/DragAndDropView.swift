//
//  DragAndDropView.swift
//  TidyDesk
//
//  Created by Steven Sarmiento on 2/12/24.
//

import SwiftUI
import UniformTypeIdentifiers
import ZIPFoundation

struct DragAndDropView: View {
    var body: some View {
        Text("Drag files here")
            .frame(width: 300, height: 300)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .onDrop(of: [.fileURL], isTargeted: nil) { providers -> Bool in
                var urls = [URL]()
                for provider in providers {
                    provider.loadItem(forTypeIdentifier: UTType.fileURL.identifier, options: nil) { (item, error) in
                        guard let data = item as? Data, let url = URL(dataRepresentation: data, relativeTo: nil) else { return }
                        urls.append(url)
                    }
                }
                
                DispatchQueue.main.async {
                    print("Received URLs: \(urls)")
                    self.handleDroppedFiles(urls: urls)
                }
                
                return true
            }
    }
    
    func handleDroppedFiles(urls: [URL]) {
        print("Handling URLs: \(urls)")

        let fileManager = FileManager.default
        let tempDirectory = fileManager.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        
        do {
            try fileManager.createDirectory(at: tempDirectory, withIntermediateDirectories: true, attributes: nil)
            print("Created temp directory at: \(tempDirectory)")
            for url in urls {
                let fileType = url.pathExtension
                let destinationFolder = tempDirectory.appendingPathComponent(fileType)
                
                if !fileManager.fileExists(atPath: destinationFolder.path) {
                    try fileManager.createDirectory(at: destinationFolder, withIntermediateDirectories: true, attributes: nil)
                }
                
                let destinationURL = destinationFolder.appendingPathComponent(url.lastPathComponent)
                try fileManager.moveItem(at: url, to: destinationURL)
                print("Moved \(url) to \(destinationURL)")
            }
            
            DispatchQueue.main.async {
                let savePanel = NSSavePanel()
                savePanel.allowedFileTypes = ["zip"]
                savePanel.nameFieldStringValue = "CompressedFiles.zip"
                print("Attempting to present save panel...")
                savePanel.begin { response in
                    print("Save panel was presented.")
                    if response == .OK, let url = savePanel.url {
                        print("User selected a file: \(url)")
                        self.compressFolder(at: tempDirectory, to: url)
                    } else {
                        print("Save panel was dismissed or encountered an error.")
                    }
                }
            }
        } catch {
            print("Error handling files: \(error)")
        }
    }

    func compressFolder(at sourceURL: URL, to destinationURL: URL) {
        let fileManager = FileManager()
        do {
            try fileManager.zipItem(at: sourceURL, to: destinationURL)
            print("Compressed folder successfully to: \(destinationURL.path)")
        } catch {
            print("Failed to compress folder: \(error)")
        }
    }

}


