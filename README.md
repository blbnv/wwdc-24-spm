# WWDC 24 - Swift Package Manager

**Problem**
We experience usual "Reloading packages" that lead to the complete freeze of Xcode every time the branch is being switched, or a new file is created/renamed. 
This is a sandbox project that helps to reproduce the problem at smaller scale with a few potential ideas we wanna consult with Apple folks.

*Environment*: Xcode 15.0-15.4

**Project overview**

1. Modules represents the modularity approach we currently have. This Swift Package has only [one product - a dynamic library](https://github.com/blbnv/wwdc-24-spm/blob/main/Modules/Package.swift#L11) that is being used in the main application target.

2. We use certain 3rd-party libraries and there are different ways of importing them. (1) [regular `dependency` approach](https://github.com/blbnv/wwdc-24-spm/blob/main/Modules/Package.swift#L79), that actually leads to "Reloading swift packages" issue. (2) `binaryTarget` [for thouse who has xcframeworks in their release artefacts](https://github.com/blbnv/wwdc-24-spm/blob/main/Modules/Package.swift#L84).

3. We've added about 60 modules and a few dependencies to this sandbox, which is totally enough to reproduce a problem.

4. As a potential solution to reduce time waiting and prevent Xcode from hang, we try to bring another Swift Package as a wrapper over 3rd-party library we use ([example](https://github.com/blbnv/wwdc-24-spm/tree/main/FirebaseWrapper)) and consume it as a local package [accessing by the path](https://github.com/blbnv/wwdc-24-spm/tree/main/FirebaseWrapper).

**Some questions and topics we would love to discuss**
1. `dependency` versus `binaryTarget` - if I use `.binaryTarget`, the "Reloading packages" issue is not reproducible. Do you think this is the right way to move forward with our problem?

2. Use `dependency` for, for example, Firebase, and trigger "Reloading packages" by creating a new file in any of the modules. As my examples shows, it works, but we can't measure the performance of it. Would  love to get some advice.
   
3. If the library does not provide us with the binary representation, is there a way to pre-build it? Some different examples:
- Library with all self-written code
- Library with other dependencies (let's assume it's a swift package)

4. If library A and B both depend on library C, but they use different versioning rules for this dependency (e.g. exact version vs up to major) that could conflict, how can we prevent that?
   
5. Is this safe to cut all unneeded architectures from the xcframework, but leave it in the modulemap?

6. Can we store these binaries in git-lfs, or any other external storages?

6. `Package.resolved` has been git-unchecked for some time in our project, but we tried check it back some time ago. The issue we see - it always being updated automatically, starting some prefixes `.git` to some of the dependencies (Package.swift) has no changes, ending with library versions.

7. How can we use prebuilt libraries that do not have modulemap and headers? [Example](https://github.com/DataDog/dd-sdk-ios/releases/tag/2.12.0)

8. What's the best way to share a third party dependency (e.g. firebase) between a few swift packages, main target and app extension target?

9. We use separate products (library) to make sure SwiftUI previews work - is there a better way to handle that?

10. Is there a good built-in tool that helps with Package.swift optimization? Shows unused dependencies, visualizes the tree, etc.



