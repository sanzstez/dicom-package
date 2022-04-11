# Rack multipart/related DICOM middleware

DicomPackage::Middleware it's a **rack middleware** to parse **multipart/related** requests with DICOM data and rebuild it to Rails compatible params.

## What does it do?

Using this middleware, params is parsed and rebuilt like the code below:

```ruby
{"files"=>{"<c66d2cd7-63e6-45e1-bad4-6681bf7d6acf@nema.org>"=>#<ActionDispatch::Http::UploadedFile:0x0000000109bd2ab8 @tempfile=#<Tempfile:/var/folders/4d/k113_9r544nfj8k0bfxtjx0m0000gn/T/1.dcm20220411-56599-34wg47>, @original_filename="1.dcm", @content_type="application/dicom", @headers=nil>, "<d1aaa4fe-697c-472c-8f59-9124073d01d0@nema.org>"=>#<ActionDispatch::Http::UploadedFile:0x0000000109bd20e0 @tempfile=#<Tempfile:/var/folders/4d/k113_9r544nfj8k0bfxtjx0m0000gn/T/2.dcm20220411-56599-aa96ex>, @original_filename="2.dcm", @content_type="application/dicom", @headers=nil>, "<41238017-4ca3-4cfc-896a-919f47d46c14@nema.org>"=>#<ActionDispatch::Http::UploadedFile:0x0000000109bd2018 @tempfile=#<Tempfile:/var/folders/4d/k113_9r544nfj8k0bfxtjx0m0000gn/T/3.dcm20220411-56599-89pzin>, @original_filename="3.dcm", @content_type="application/dicom", @headers=nil>}}
```

## Usage

In your Gemfile:

```bash
gem 'dicom-package'
```

In your environment.rb:

```ruby
config.middleware.use DicomPackage::Middleware
```
