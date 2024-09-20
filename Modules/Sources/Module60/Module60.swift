import LegacyApollo
import Apollo

public class Module60 {
    public static func printVersion() {
        print("\(LegacyApollo.ApolloStore())")
        print("\(Apollo.ApolloStore())")
    }
}
