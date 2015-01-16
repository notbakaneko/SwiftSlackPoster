# SwiftSlackPoster
A Swift client that posts messages to incoming webhooks on Slack.
This is a basic client that just posts attachments to Slack as-is; it does no formatting whatsoever.

# Example
I've not actually run nor tried to compile this example :3

```swift
if let url = NSURL("https://hooks.slack.com/services/your-incoming-webhook-url-goes-here") {
  let slackPoster = SlackPoster(url: url)
  slackPoster.username = "username to appear on messages"
  
  var fields = [
    Field(title: "Field 1", value: "A short field"),
    Field(title: "Field 2", value: "A long field that is not actually very long", short: false)
  ]
  
  var attachment = Attachment(
    text: "optional text",
    pretext: "optional pretext",
    fallback: "required fallback message",
    color: "#36a64f", // Can either be one of 'good', 'warning', 'danger', or any hex color code
    fields: fields
  )
  
  // posts asynchronously; does not perform and error handling yet :)
  slackPoster.post(attachment)
}
```
