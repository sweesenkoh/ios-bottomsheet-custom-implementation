# Custom iOS Bottom Sheet

This project introduces a custom bottom sheet implementation that emulates iOS's native bottom sheet behavior, extending support to iOS versions prior to iOS 15. By bypassing the limitations of UISheetPresentationController, which is only available from iOS 15 and later, this solution offers a versatile and straightforward method to incorporate bottom sheet functionality into iOS applications. 

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
