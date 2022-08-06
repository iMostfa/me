//
//  File.swift
//  
//
//  Created by Mostfa on 28/07/2022.
//

import Plot
import Ink
import Publish
import ReadingTimePublishPlugin

public extension Theme {
  /// The default "Foundation" theme that Publish ships with, a very
  /// basic theme mostly implemented for demonstration purposes.
  static var foundation2: Self {
    Theme(
      htmlFactory: Foundation2HTMLFactory(),
      resourcePaths: ["styles.css"]
    )
  }
}

private struct Foundation2HTMLFactory<Site: Website>: HTMLFactory {
  func makeIndexHTML(for index: Index,
                     context: PublishingContext<Site>) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: index, on: context.site),
      .body(
        .header(for: context, selectedSection: nil),
        .wrapper(
          .h1(.text(index.title)),
          .p(
            .class("description"),
            .text(context.site.description)
          ),
          .h2("آخر التدوينات"),
          .itemList(
            for: context.allItems(
              sortedBy: \.date,
              order: .descending
            ),
            on: context.site
          )
        ),
        .footer(for: context.site)
      )
    )
  }
  
  func makeSectionHTML(for section: Section<Site>,
                       context: PublishingContext<Site>) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: section, on: context.site),
      .body(
        .header(for: context, selectedSection: section.id),
        .wrapper(
          .h1(.text(section.title)),
          .itemList(for: section.items, on: context.site)
        ),
        .footer(for: context.site)
      )
    )
  }
  
  func makeItemHTML(for item: Item<Site>,
                    context: PublishingContext<Site>) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: item, on: context.site),
      .body(
        .class("item-page"),
        .header(for: context, selectedSection: item.sectionID),
        .wrapper(
          .article(
            .div(
              .class("content"),
              .h1(.text(item.title)),
              .tagList(for: item, on: context.site, withDate: true),
              .p("\(item.readingTime.minutes) وقت القراءة:"),
              .contentBody(item.body)
            )
          )
        ),
        .comments(for: item),
        .footer(for: context.site)
      )
    )
  }
  
  func makePageHTML(for page: Page,
                    context: PublishingContext<Site>) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site),
      .body(
        .header(for: context, selectedSection: nil),
        .wrapper(.contentBody(page.body)),
        .footer(for: context.site)
      )
    )
  }
  
  func makeTagListHTML(for page: TagListPage,
                       context: PublishingContext<Site>) throws -> HTML? {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site),
      .body(
        .header(for: context, selectedSection: nil),
        .wrapper(
          .h1("Browse all tags"),
          .ul(
            .class("all-tags"),
            .forEach(page.tags.sorted().enumerated()) { index,tag in
                .li(
                  .class("tag"),
                  .style("background-color: \(TagType.init(rawValue: tag.string)?.color ?? "#0000");"),
                  .a(
                    .href(context.site.path(for: tag)),
                    .text(tag.string)
                  )
                )
            }
          )
        ),
        .footer(for: context.site)
      )
    )
  }
  
  func makeTagDetailsHTML(for page: TagDetailsPage,
                          context: PublishingContext<Site>) throws -> HTML? {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site),
      .body(
        .header(for: context, selectedSection: nil),
        .wrapper(
          .h1(
            "Tagged with ",
            .span(.class("tagA"), .text(page.tag.string))
          ),
          .a(
            .class("browse-all"),
            .text("Browse all tags"),
            .href(context.site.tagListPath)
          ),
          .itemList(
            for: context.items(
              taggedWith: page.tag,
              sortedBy: \.date,
              order: .descending
            ),
            on: context.site
          )
        ),
        .footer(for: context.site)
      )
    )
  }
}

private extension Node where Context == HTML.BodyContext {
  static func wrapper(_ nodes: Node...) -> Node {
    .div(.class("wrapper"), .group(nodes))
  }
  static func headerWrapper(_ nodes: Node...) -> Node {
    .div(.class("headerWrapper"), .group(nodes))
  }
  
  
  static func header<T: Website>(
    for context: PublishingContext<T>,
    selectedSection: T.SectionID?
  ) -> Node {
    let sectionIDs = T.SectionID.allCases
    
    
    return .header(
      .headerWrapper(
        //.img(.src(.init("https://media.caramel.la/Eq5Kk8P5W?e=0,0,754,455&f=webp&r=240")),.class("image-item-class")),
        .if(selectedSection != nil,
            .a(.class("item-name"), .href("/"), .text(context.site.name),.img(.class("image-icon"),.src(.init("https://avatars.githubusercontent.com/u/2325884?v=4"))))
            ,else:
            .a(.class("site-name"), .href("/"), .text(context.site.name))),
        .if(sectionIDs.count > 1,
            .nav(
              .ul(.forEach(sectionIDs) { section in
                  .li(.a(
                    .class(section == selectedSection ? "selected" : ""),
                    .href(context.sections[section].path),
                    .text(context.sections[section].title)
                  ))
              })
            )
        )
      )
    )
  }
  // height: 130px;
  static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
    return .ul(
      
      .class("item-list grid"),
      .forEach(items.enumerated()) { index, item in
          .li(
            
            .img(.src(.init(item.imagePath?.string ??  "https://media.caramel.la/Eq5Kk8P5W?e=0,0,754,455&f=webp&r=240")),.class("image-item-class")),
            .style("background-color: #202020; height: \(diffrenetSizing[index % 4])px;"),
            .article(
              .h1(.a(
                .href(item.path),
                .text(item.title)
              )),
              .p(.text(item.description)),
              .tagList(for: item, on: site, withDate: false)
              
            ))
      }
    )
  }
  
  static func dateFrom(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ar_EG")
    formatter.dateFormat = "EEEE, d, MMMM, yyyy HH:mm a"
    let outputDate = formatter.string(from: date)
    
    return outputDate
  }
  
  static func tagList<T: Website>(for item: Item<T>, on site: T, withDate: Bool) -> Node {
    return .ul(
      
      withDate ?
        .li(
          .text(
            dateFrom(date: item.date)
          ),.style("background-color: #6a0dad;")): .empty
      
      ,
      
        .class("tag-list"),
      .forEach(item.tags) { tag -> Node<HTML.ListContext> in
          .li(
            
            !withDate ?  .a(
              .href(site.path(for: tag)),
              .text(tag.string)
            ): .text(tag.string)
            ,.style("background-color: \(TagType.init(rawValue: tag.string)!.color ?? "#0000");"))
      }
      
    )
  }
  
  static func comments<T: Website>(for item: Item<T>) -> Node {
    let commentsSupport =
    """
<div id="disqus_thread"></div>
<script>
    /**
    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
    
    var disqus_config = function () {
    this.page.url = http://imostfa.github.io/Blog/\(item.path);  // Replace PAGE_URL with your page's canonical URL variable
    this.page.identifier = \(item.path); // Replace PAGE_IDENTIFIER with your page's unique identifier variable
    };
    
    (function() { // DON'T EDIT BELOW THIS LINE
    var d = document, s = d.createElement('script');
    s.src = 'https://imostfa.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
"""
    return .element(named: "CommentsSupport", nodes: [.raw(commentsSupport)]).node
  }
  
  static func footer<T: Website>(for site: T) -> Node {
    return .footer(
      .p(
        .text("Made with 💞 Using "),
        .a(
          .text("Swift"),
          .href("https://github.com/johnsundell/publish")
        )
      ),
      .p(.a(
        .text("RSS feed"),
        .href("/feed.rss")
      ))
    )
  }
}


var diffrenetSizing = [1,2,3,4,5,6,7].map {_ in  return 340}


var diffrenetColors = ["#63BFD8",
                       "#999999",
                       "#FF7073",
                       "#E9A03D",
                       "#6A9DF1",
                       "#BF9B4C"
]

import AppKit.NSColor

enum TagType: String {
  case mocking = "Mocking"
  case testing = "Unit testing"
  case performance = "d"
  case computerScience = "Computer Science"
  case Memory
  case Interviews
  case Arabic
  case LifeIsHard
  
  
  typealias hexColor = String
  
  var color: hexColor {
    switch self {
    case .mocking:
      return #colorLiteral(red: 0.2235294118, green: 0.5176470588, blue: 0.4, alpha: 1).hexString
    case .testing:
      return #colorLiteral(red: 0.7882352941, green: 0.2941176471, blue: 0.2666666667, alpha: 1).hexString
      //            return #colorLiteral(red: 0.2235294118, green: 0.5176470588, blue: 0.4, alpha: 1).hexString
    case .performance:
      return #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).hexString
    case .computerScience:
      return #colorLiteral(red: 0.274835974, green: 0.3332764208, blue: 0.431849122, alpha: 1).hexString
    case .Arabic:
      return #colorLiteral(red: 0.3294117647, green: 0.3294117647, blue: 0.6117647059, alpha: 1).hexString
    case .Memory:
      return #colorLiteral(red: 0.3048941195, green: 0.5726054311, blue: 0.8743758798, alpha: 1).hexString
      
    case .LifeIsHard:
      return #colorLiteral(red: 0.161354512, green: 0.159904331, blue: 0.2076623142, alpha: 1).hexString
      
    case .Interviews:
      return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).hexString
      
    }
  }
}
extension NSColor {
  var hexString: String {
    let colorRef = cgColor.components
    let r = colorRef?[0] ?? 0
    let g = colorRef?[1] ?? 0
    let b = ((colorRef?.count ?? 0) > 2 ? colorRef?[2] : g) ?? 0
    let a = cgColor.alpha
    
    var color = String(
      format: "#%02lX%02lX%02lX",
      lroundf(Float(r * 255)),
      lroundf(Float(g * 255)),
      lroundf(Float(b * 255))
    )
    
    if a < 1 {
      color += String(format: "%02lX", lroundf(Float(a)))
    }
    
    return color
  }
}
