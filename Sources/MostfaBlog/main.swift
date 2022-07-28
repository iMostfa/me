import Foundation
import Publish
import Plot

import SplashPublishPlugin
// This type acts as the configuration for your website.
struct MostfaBlog: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {

        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://imostfa.github.io/Blog/")!
    var name = "Mostfa's Blog  |  كلامٌ مُصطفى"
    var description = "كلام فارغ، لكن لذيذ "
    var language: Language { .arabic }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try MostfaBlog().publish(withTheme: .foundation,
                         additionalSteps: [
                          .deploy(using: .git("https://github.com/iMostfa/Blog.git")),
                          .copyFiles(at: "fonts",
                                                     to: "/fonts")

                         ],
                         plugins: [.splash(withClassPrefix: "")])


//try MostfaBlog.init().publish(using: [.generateHTML(withTheme: .foundation),
//                                      .deploy(using: .git("https://github.com/iMostfa/Blog.git")),
//                                      .copyFiles(at: "fonts", to: "fonts"),
//                                      .installPlugin(.splash(withClassPrefix: ""))
//
//])
//try MostfaBlog().publish(using: [
//    .with
//    .deploy(using: .gitHub("imostfa/Blog"))
//])
//

extension PublishingStep where Site == MostfaBlog {
  /// Copy website to Github Pages website location in repository.
  /// - parameter path: The path to the website root folder for Github Pages.
  static func outputToGithubPages(path: String = "Blog") -> Self {
    step(named: "Copy Output to Github Pages Path '\(path)'") { context in
      let docsFolder = try context.createDeploymentFolder(
        withPrefix: "Blog",
        configure: { folder in try folder.rename(to: "Blog") }
      )
      try docsFolder.move(to: docsFolder.parent!.parent!)
    }
  }
}
