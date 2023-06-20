workspace "Top" {

    !docs docs/

    model {

        System = softwareSystem "System" "" {

            !docs docs/system/

            Container1 = container "Container 1"
            Container2 = container "Container 2" {
                !docs docs/system/container

                Component1 = component "Component 1"
                Component2 = component "Component 2" {
                    !docs docs/system/container/component
                }
            }
        }

        CustomElement = element "Custom Element"

        Container1 -> Container2
        Container2 -> customElement

        Component1 -> Component2
        Component2 -> customElement
    }

    views {
        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        container System {
            include *
            autoLayout
        }

        component Container2 {
            include *
            autoLayout
        }


        styles {
            element "customElement" {
                color #ffffff
                fontSize 22
                shape Folder
            }
            element "Container" {
                background #999999
            }
            element "Software System" {
                background #999999
                color #ffffff
            }
        }

        properties {
            structurizr.sort "created"
            structurizr.tooltips "true"
            structurizr.enterpriseBoundary "true"

            // Generatr
            "c4plantuml.elementProperties" "true"
            "generatr.markdown.flexmark.extensions" "Abbreviation,Admonition,AnchorLink,Attributes,Autolink,Definition,Emoji,Footnotes,GfmTaskList,GitLab,MediaTags,Tables,TableOfContents,Typographic"
        }
    }

    // see https://github.com/structurizr/dsl-plugins/tree/main/src/main/java/com/structurizr/dsl/plugins/plantuml for plugin source
    !plugin plantuml.PlantUMLEncoderPlugin {
        "plantuml.url" "https://www.plantuml.com/plantuml"
    }

    // see https://github.com/structurizr/dsl-plugins/tree/main/src/main/java/com/structurizr/dsl/plugins/mermaid for plugin source
    !plugin mermaid.MermaidEncoderPlugin {
        "mermaid.url" "https://mermaid.ink"
    }

}
