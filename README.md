# Custom iOS Bottom Sheet

This project presents a custom implementation designed to mimic the behavior and appearance of the iOS system bottom sheet. Typically, to implement such feature, we would use the `UISheetPresentationController` API, but it is only available from iOS 15 onwards. This project is created to support this feature for older iOS versions. It provides a flexible and easy-to-use solution for adding bottom sheet functionality to your iOS applications, with additional features such as drag-to-dismiss and scroll view handling.

## Demo

<img src="https://github.com/sweesenkoh/SEC-Filings-Parser/assets/48687942/5c16f592-94d4-4e0d-b904-8c23d661e806" height="400" width="200">

## Features

- **Drag to Dismiss**: Users can dismiss the bottom sheet by dragging it down.
- **Scroll View Support**: Integrated support for `UIScrollView` and subclasses like `UITableView`, allowing the bottom sheet to stay in place when scrolling content.
- **Customizable Height**: The height of the bottom sheet can be customized to fit the content or achieve specific designs.
- **Dimmed Background**: Presents a dimmed background to focus user attention on the bottom sheet content.

## Installation

To use the custom bottom sheet in your project, simply reference the code in the `BottomSheetViewController.swift` and `CountrySelectionViewController.swift` files into your Xcode project. 

## Usage

**Subclass `BottomSheetViewController`** for your specific use case, similar to the provided `CountrySelectionViewController` example.
