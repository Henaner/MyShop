package cn.wangchenhui.model;

public class ShopException extends RuntimeException{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4033800311641203956L;

	public ShopException() {
        super();
    }

    public ShopException(String message) {
        super(message);
    }

    public ShopException(String message, Throwable cause) {
        super(message, cause);
    }

    public ShopException(Throwable cause) {
        super(cause);
    }

    protected ShopException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
